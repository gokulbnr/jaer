/* 
 * Copyright (C) 2017 Tobi.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301  USA
 */
package ch.unizh.ini.jaer.projects.npp;

import com.jogamp.opengl.GL2;
import com.jogamp.opengl.GLAutoDrawable;
import eu.visualize.ini.convnet.DeepLearnCnnNetwork_HJ;
import java.awt.Dimension;
import java.util.Arrays;
import java.util.logging.Logger;
import javax.swing.BoxLayout;
import javax.swing.JFrame;
import javax.swing.JPanel;
import net.sf.jaer.chip.AEChip;
import net.sf.jaer.event.BasicEvent;
import net.sf.jaer.event.EventPacket;

import net.sf.jaer.event.PolarityEvent;
import net.sf.jaer.event.PolarityEvent.Polarity;
import net.sf.jaer.eventprocessing.EventFilter2D;
import net.sf.jaer.graphics.FrameAnnotater;
import net.sf.jaer.graphics.ImageDisplay;
import net.sf.jaer.util.filter.LowpassFilter;

/**
 * Abstract class for subsampling DVS input ON and OFF events to "frames"
 *
 * The concrete subclasses either sample to a single frame or multiple regions
 * of interest frames.
 *
 * The DVSFrame is a grayscale 2D histogram. By subsampling (accumulation) of
 * events it performs much better than downsampling the sparse DVS output. The
 * output of the subsampler is available as a float array that is scaled by the
 * color scale for each event (with sign for ON and OFF events) and clipped to
 * 0-1 range.
 *
 * When DVS frame is accumulated to full exposure (dvsEventsPerFrame), the frame
 * is normalized, and a PropertyChangeEvent EVENT_NEW_FRAME_AVAILABLE is
 * generated and listeners should respond by processing the frame. The frame is
 * reset automatically the next time an new event is then added to it.
 *
 * @author tobi
 * @see #addEvent(net.sf.jaer.event.PolarityEvent)
 * @see #EVENT_NEW_FRAME_AVAILABLE
 *
 */
abstract public class DvsFramer extends EventFilter2D implements FrameAnnotater {

    protected static Logger log = Logger.getLogger("DvsFramer");
    /**
     * PropertyChangeEvent that is fired when a new DVS frame is available.
     *
     * @see #addEvent(net.sf.jaer.event.PolarityEvent)
     */
    public static final String EVENT_NEW_FRAME_AVAILABLE = "EVENT_NEW_FRAME_AVAILABLE";
    public final float GRAY_LEVEL = 0.5f;
    protected boolean rectifyPolarities = getBoolean("rectifyPolarities", true); // true by default to make RoShamBo CNN work properly out of the box
    protected int dvsEventsPerFrame = getInt("dvsEventsPerFrame", 2000);
    protected int dvsGrayScale = getInt("dvsGrayScale", 100); // 1/dvsColorScale is amount each event color the timeslice in subsampled timeslice input
    private boolean normalizeDVSForZsNullhop = getBoolean("normalizeDVSForZsNullhop", true); // uses DvsFramer normalizeFrame method to normalize DVS histogram images and in addition it shifts the pixel values to be centered around zero with range -1 to +1
    protected float dvsGrayScaleRecip;
    protected int warningsBadEvent = 0;

    /**
     * Global flag to show that the entire DvsFramer has been cleared
     */
    protected boolean cleared = true;
    protected int lastIntervalUs = 0;
    protected LowpassFilter frameIntervalFilter = new LowpassFilter(1000);
    protected int startTimestamp = 0;

    private boolean showFrames = false;
    private JFrame activationsFrame = null;
    private ImageDisplay imageDisplay;
    protected DvsFrame lastDvsFrame=null;

    /**
     * Makes a new DvsSubsamplingTimesliceConvNetInput
     *
     * @param dimX
     * @param dimY
     * @param colorScale initial scale by which each ON or OFF event is added to
     * the pixmap.
     * @see #setDvsGrayScale(int)
     */
    public DvsFramer(AEChip chip) {
        super(chip);
        dvsGrayScaleRecip = 1f / dvsGrayScale;
        setPropertyTooltip("dvsEventsPerFrame", "num DVS events accumulated to subsampled ROI to fill the frame");
        setPropertyTooltip("showFrames", "shows the fully exposed (accumulated with events) frames in a separate window");
        setPropertyTooltip("dvsGrayScale", "sets the full scale value for the DVS frame rendering");
        setPropertyTooltip("rectifyPolarities", "whether DVS events have their polarity ignored.");
        setPropertyTooltip("normalizeDVSForZsNullhop", "uses DvsSubsamplerToFrame normalizeFrame method to normalize DVS histogram images and in addition it shifts the pixel values to be centered around zero with range -1 to +1\n");
    }

    /**
     * Does nothing, since frame should be filled by the enclosing filter using
     * addEvent
     *
     * @param in
     * @return the input packet, untouched and unused
     * @see #addEvent(net.sf.jaer.event.PolarityEvent)
     */
    @Override
    synchronized public EventPacket<?> filterPacket(EventPacket<?> in) {
        return in;
    }

    /**
     * Adds event from a source event location to the map by integer division to
     * the correct location in the subsampled DVS frame.
     *
     * The implementing subclass should generate a PropertyChangeEvent
     * EVENT_NEW_FRAME_AVAILABLE when the frame is fully exposed (has
     * accumulated dvsEventsPerFrame events).
     *
     * When DVS frame is accumulated to full exposure (dvsEventsPerFrame), the
     * frame is normalized, and a PropertyChangeEvent EVENT_NEW_FRAME_AVAILABLE
     * is generated and listeners should respond by processing the frame. The
     * frame is reset automatically the next time an new event is then added to
     * it.
     *
     * @param e the event to add
     * @param srcWidth width of originating source sensor, e.g. 240 for DAVIS240
     * @param srcHeight height of source address space
     */
    abstract public void addEvent(PolarityEvent e);

    /**
     * Sets parameters from a CNN
     *
     * @param apsDvsNet
     */
    abstract public void setFromNetwork(AbstractDavisCNN apsDvsNet);

    /**
     * Sets parameters from a CNN that processes to produce a heat map
     *
     * @param apsDvsNet
     */
    abstract public void setFromNetwork(DeepLearnCnnNetwork_HJ apsDvsNet);

    /**
     * @return the dvsGrayScale
     */
    public int getDvsGrayScale() {
        return dvsGrayScale;
    }

    /**
     * Sets the amount by which the pixmap is updated by each ON/OFF event.
     *
     * @param dvsGrayScale the dvsGrayScale to set
     */
    public void setDvsGrayScale(int dvsGrayScale) {
        this.dvsGrayScale = dvsGrayScale;
        dvsGrayScaleRecip = 1f / dvsGrayScale;
        putInt("dvsGrayScale", dvsGrayScale);
    }

    /**
     * Allocates memory for results
     *
     * @return true if memory was allocated, false if size is zero or some other
     * condition indicates that processing should be skipped.
     */
    abstract public boolean allocateMemory();

    /**
     * Sets the internal timestamp values to initialize temporal statistics
     * filters
     *
     * @param e any event
     */
    protected void initialize(BasicEvent e) {
        if (cleared) {
            cleared = false;
            int lastStartTimestamp = startTimestamp;
            if (e.timestamp < startTimestamp) {
                frameIntervalFilter.reset();
                lastStartTimestamp = e.timestamp;
            }
            startTimestamp = e.timestamp;
            lastIntervalUs = startTimestamp - lastStartTimestamp;
            if (lastStartTimestamp != 0) {
                frameIntervalFilter.filter(lastIntervalUs, startTimestamp);
            }
        }
    }

    public float getFilteredSubsamplerIntervalUs() {
        return frameIntervalFilter.getValue();
    }

    public int getLastSubsamplerFrameIntervalUs() {
        return lastIntervalUs;
    }

    /**
     * @return the rectifyPolarties
     */
    public boolean isRectifyPolarities() {
        return rectifyPolarities;
    }

    /**
     * True: Events of both ON and OFF type produce positive pixel values;
     * starting frame is set to 0.
     * <br>
     * False: Events produce negative (for OFF events) and positive (for ON
     * events); starting frame is set to 0.5.
     *
     * @param rectifyPolarities the rectifyPolarties to set
     */
    public void setRectifyPolarities(boolean rectifyPolarities) {
        boolean old = this.rectifyPolarities;
        this.rectifyPolarities = rectifyPolarities;
        putBoolean("rectifyPolarities", rectifyPolarities);
        getSupport().firePropertyChange("rectifyPolarities", old, rectifyPolarities);
    }

    @Override
    public void resetFilter() {
        warningsBadEvent = 0;
    }

    /**
     * Should clear all frame contents to prepare for new data.
     */
    abstract public void clear();

    @Override
    public void initFilter() {
        allocateMemory();
    }

    /**
     * @return the dvsEventsPerFrame
     */
    public int getDvsEventsPerFrame() {
        return dvsEventsPerFrame;
    }

    /**
     * @param dvsEventsPerFrame the dvsEventsPerFrame to set
     */
    public void setDvsEventsPerFrame(int dvsEventsPerFrame) {
        this.dvsEventsPerFrame = dvsEventsPerFrame;
        putInt("dvsEventsPerFrame", dvsEventsPerFrame);
    }

    /**
     * @return the normalizeDVSForZsNullhop
     */
    public boolean isNormalizeDVSForZsNullhop() {
        return normalizeDVSForZsNullhop;
    }

    /**
     * @param normalizeDVSForZsNullhop the normalizeDVSForZsNullhop to set
     */
    public void setNormalizeDVSForZsNullhop(boolean normalizeDVSForZsNullhop) {
        this.normalizeDVSForZsNullhop = normalizeDVSForZsNullhop;
        putBoolean("normalizeDVSForZsNullhop", normalizeDVSForZsNullhop);
    }

    protected void checkActivationsFrame() {
        if (activationsFrame != null) {
            return;
        }
        String windowName = "DvsFramer";
        activationsFrame = new JFrame(windowName);
        activationsFrame.setLayout(new BoxLayout(activationsFrame.getContentPane(), BoxLayout.Y_AXIS));
        activationsFrame.setPreferredSize(new Dimension(600, 600));
    }

    @Override
    public void annotate(GLAutoDrawable drawable) {
        GL2 gl = drawable.getGL().getGL2();
        if(showFrames && lastDvsFrame!=null){
            lastDvsFrame.draw();
        }

    }

    public class DvsFrame {

        protected int width = 0; // width of output
        protected int height = 0; // height of output
        protected int nPixels = 0;
        private int[] eventSum; // eventSum contains raw integer signed event count
        private float[] pixmap; // pixmap contains the scaled event count centered on 0.5 and clipped to 0-1 range
        private int accumulatedEventCount = 0;
        private int mostOffCount = Integer.MAX_VALUE, mostOnCount = Integer.MIN_VALUE;
        private float sparsity = 1;  // computed when frame is normalized
        private boolean filled = false; // set true by accumulating dvsEventsPerFrame, cleared by clear()

        public void clear() {
            if (eventSum == null) {
                log.warning("null eventSum array, memory not yet allocated");
                return;
            }
            Arrays.fill(eventSum, 0);
            Arrays.fill(pixmap, rectifyPolarities ? 0 : GRAY_LEVEL);
            accumulatedEventCount = 0;
            mostOffCount = Integer.MAX_VALUE;
            mostOnCount = Integer.MIN_VALUE;
            lastIntervalUs = 0;
            accumulatedEventCount = 0;

            cleared = true;
            filled = false;
        }

        /**
         * Adds event of polarity <code>p</code> to location <code>x,y</code> in
         * the DVS frame.
         *
         * Calls normalizeFrame() and then fires the PropertyChangeEvent
         * EVENT_NEW_FRAME_AVAILABLE when the frame is fully exposed by
         * accumulating dvsEventsPerFrame. The next event added to the frame
         * first clears if after it is filled.
         *
         * @param x x location in frame
         * @param y y location in frame
         * @param p polarity (On/Off) of event.
         * @see #normalizeFrame()
         * @see #EVENT_NEW_FRAME_AVAILABLE
         */
        public void addEvent(int x, int y, Polarity p) {
            if (filled) {
                clear();
            }
            int k = getIndex(x, y);
            if (((k < 0) || (k >= eventSum.length))) {
                if (warningsBadEvent < 2) {
                    log.warning("ignoring event with index out of bounds for event x=" + x + "y=" + y);
                }
                if (warningsBadEvent == 2) {
                    log.warning("supressing further warnings");
                }
                warningsBadEvent++;
                return;
            }
            int sum = eventSum[k];
            sum += rectifyPolarities ? 1 : (p == PolarityEvent.Polarity.On ? 1 : -1);
            // clip count at full scale
            if (sum > dvsGrayScale) {
                sum = dvsGrayScale;
            } else if (sum < -dvsGrayScale) {
                sum = dvsGrayScale;
            }
            // keep track of largest and smallest count
            if (sum > mostOnCount) {
                mostOnCount = sum;
            } else if (sum < mostOffCount) {
                mostOffCount = sum;
            }
            eventSum[k] = sum; // eventSum contains raw integer signed event count
            // compute the pixmap value (pmv) using gray level and dvsGrayScale
            float pmv = 0;
            if (!rectifyPolarities) {
                pmv = GRAY_LEVEL + ((sum * dvsGrayScaleRecip) / 2); // full scale is +/- dvsGrayScale events
            } else {
                pmv = sum * dvsGrayScaleRecip; // full scale is just exactly dvsGrayScale events
            }
            if (pmv > 1) {
                pmv = 1;
            } else if (pmv < 0) {
                pmv = 0;
            }
            // pixmap contains the scaled event count clipped to 0-1 range and either starting at zero or centered on 0.5, depending on rectifyPolarties
            // This pixmap value is OVERWRITEN later if the frame is normalized, but otherwise if normalizeFrame is not called, then
            // the pixmap value set here is the one that is returned (and typically used for rendering image) 
            pixmap[k] = pmv;
            accumulatedEventCount++;
            if (getAccumulatedEventCount() >= dvsEventsPerFrame) {
                filled = true;
                normalizeFrame();
                lastDvsFrame=this;
                getSupport().firePropertyChange(EVENT_NEW_FRAME_AVAILABLE, null, this); // TODO check if duplicated event fired
            }
        }

        /**
         * Returns the float value of the histogram clipped to 0-1 range and
         * scaled by dvsGrayScale, or normalized. To have these values
         * normalized, call normalizeFrame.
         *
         * Returns the scaled event count clipped to 0-1 range and either
         * starting at zero or centered on 0.5, depending on rectifyPolarties
         * first.
         *
         * @param x
         * @param y
         * @return the value of the subsampled map
         * @see #normalizeFrame()
         */
        public float getValueAtPixel(int x, int y) {
            return pixmap[getIndex(x, y)];
        }

        /**
         * Returns value of resulting pixmap after normalization for pixels with
         * zero net event count
         *
         * @return rectifyPolarties?0: 127f / 255;
         */
        public float getZeroCountPixelValue() {
            return rectifyPolarities ? 0 : 127f / 255;
        }

        /**
         * Returns the integer event sum of the histogram clipped to +/-
         * dvsGrayScale range. If rectifyPolarties==true, then the events are
         * rectified to +1, otherwise the events are accumulated with +/-1
         * polarity value.
         *
         * @param x
         * @param y
         * @return the value of the subsampled map
         * @see #getValueAtPixel(int, int)
         */
        public int getEventSumAtPixel(int x, int y) {
            return eventSum[getIndex(x, y)];
        }

        /**
         * Sets the value of eventSum array. Utility method used for debugging
         * normalization.
         *
         * @param x
         * @param y
         */
        public void setEventSumAtPixel(int value, int x, int y) {
            eventSum[getIndex(x, y)] = value;
        }

        /**
         * Gets the index into the pixmap
         *
         * @param x
         * @param y
         * @return the index into the 1d arrays
         */
        public int getIndex(int x, int y) {
            return y + (height * x);
        }

        /**
         * @return the nPixels
         */
        public int getnPixels() {
            return nPixels;
        }

        /**
         * Returns the float[] 0-1 clipped image. Pixels are ordered as y +
         * (height * x), i.e. by columns
         *
         * @return the pixmap
         */
        public float[] getImage() {
            return pixmap;
        }

        /**
         * Returns total event count accumulated since clear
         *
         * @return the accumulatedEventCount
         */
        public int getAccumulatedEventCount() {
            return accumulatedEventCount;
        }

        /**
         * Returns index of pixel with most OFF count
         *
         * @return the mostOffCount
         */
        public int getMostOffCount() {
            return mostOffCount;
        }

        /**
         * Returns index of pixel with most ON count
         *
         * @return the mostOnCount
         */
        public int getMostOnCount() {
            return mostOnCount;
        }

        /**
         * Call this method to normalize accumulated frame to have zero mean and
         * range 0-1 using 3-sigma values, as is used in CNNNetwork.
         */
        public void normalizeFrame() {
            final float zeroValue = getZeroCountPixelValue(), fullscale = 1 - zeroValue;
            // net trained gets 0-1 range inputs, so make our input so
            int n = eventSum.length;
            float sum = 0, var = 0, count = 0;
            // sum and average only non-zero pixels
            for (int i = 0; i < n; i++) {
                if (eventSum[i] != 0) {
                    sum += eventSum[i];
                    count++;
                }
            }
            float mean = sum / count; // compute mean of all signed event counts

            for (int i = 0; i < n; i++) {
                if (eventSum[i] != 0) {
                    float f = (eventSum[i] - mean);
                    var += f * f;
                }
            }
            var = (var / count);
            float sig = (float) Math.sqrt(var); // compute 1-sigma of signed counts
            if (sig < (0.1f / 255.0f)) {
                sig = 0.1f / 255.0f;  // restrict sigma to reasonable range
            }
            // if rectifyPolarties is false, pixels with count zero should end up with this 0-1 range value so that they come out to 127 in PNG file range of 0-255
            // if rectifyPolarties is true, pixels with zero count should end up with zero, and we use only 3 sigma range
            final float numSDevs = 3;
            final float mean_png_gray = rectifyPolarities ? 0 : 127f / 255;
            final float range = rectifyPolarities ? numSDevs * sig : 2 * numSDevs * sig, halfRange = rectifyPolarities ? 0 : numSDevs * sig;
            final float rangenew = 1;
            int nonZeroCount = 0;
            //Now pixels with zero count go to 127/255, pixels with -3sigma or larger negative count go to 0,
            // and pixels with +3sigma or larger positive count go to 1. each count contributes +/- 1/6sigma to pixmap.
            for (int i = 0; i < n; i++) {
                if (eventSum[i] == 0) {
                    pixmap[i] = mean_png_gray;
                } else {
                    nonZeroCount++;
                    // rectifyPolarties=false: shift up by 3 sigma and divide by 6 sigma to get in range 0-1
                    // rectifyPolarties=true: don't shift (already origin at zero) and divide by 3 sigma to get in range 0-1
                    float f = ((eventSum[i] + halfRange) * rangenew) / range;
                    if (f > 1) {
                        f = 1;
                    } else if (f < 0) {
                        f = 0;
                    }
                    float v = normalizeDVSForZsNullhop ? (f - zeroValue) / fullscale : f;
                    pixmap[i] = v;
                }
            }
            sparsity = (float) (n - nonZeroCount) / n;
        }

        /**
         * Draws the DVS frame into the imageDisplay in the JFrame
         *
         */
        public void draw() {
            checkActivationsFrame();
            if (imageDisplay == null) {
                JPanel panel = new JPanel();
                panel.setLayout(new BoxLayout(panel, BoxLayout.X_AXIS));
                imageDisplay = ImageDisplay.createOpenGLCanvas();
                imageDisplay.setBorderSpacePixels(0);
                imageDisplay.setImageSize(width, height);
                imageDisplay.setSize(200, 200);
                panel.add(imageDisplay);

                activationsFrame.getContentPane().add(panel);
                activationsFrame.pack();
                activationsFrame.setVisible(true);
            }
            imageDisplay.setImageSize(width, height);
            imageDisplay.setPixmapFromGrayArray(pixmap);
//            imageDisplay.setPixmapArray(pixmap);
            imageDisplay.display();
        }

        /**
         * Returns the computed sparsity (fraction of nonzero pixels) if
         * normalizeFrame is called beforehand.
         *
         * @return the sparsity
         */
        public float getSparsity() {
            return sparsity;
        }

        /**
         * Allocates pixel memory. Returns true if successful
         *
         * @return true if successful, false if size is zero or negative
         */
        public boolean allocateMemory() {
            if (nPixels <= 0) {
                return false;
            }
            if (pixmap == null || pixmap.length != getnPixels()) {
                pixmap = new float[getnPixels()];
                eventSum = new int[getnPixels()];
                clear();
            }
            return true;
        }

        /**
         * Sets the size of the DVS from the input layer of the CNN
         *
         * @param apsDvsNet the CNN
         */
        public void setFromNetwork(AbstractDavisCNN apsDvsNet) {
            width = apsDvsNet.getInputLayer().getWidth();
            height = apsDvsNet.getInputLayer().getHeight();
        }

        // legacy support
        public void setFromNetwork(DeepLearnCnnNetwork_HJ apsDvsNet) {
            width = apsDvsNet.inputLayer.dimx;
            height = apsDvsNet.inputLayer.dimy;
        }

        /**
         * @return the width
         */
        public int getWidth() {
            return width;
        }

        /**
         * @return the height
         */
        public int getHeight() {
            return height;
        }

        /**
         * @param width the width to set
         */
        public void setWidth(int width) {
            this.width = width;
            nPixels = width * height;
        }

        /**
         * @param height the height to set
         */
        public void setHeight(int height) {
            this.height = height;
            nPixels = width * height;
        }

    }

    /**
     * @return the showFrames
     */
    public boolean isShowFrames() {
        return showFrames;
    }

    /**
     * @param showFrames the showFrames to set
     */
    public void setShowFrames(boolean showFrames) {
        if(activationsFrame!=null){
            activationsFrame.setVisible(showFrames);
        }
        this.showFrames = showFrames;
    }
}
