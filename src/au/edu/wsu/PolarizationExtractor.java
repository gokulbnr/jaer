package au.edu.wsu;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.geom.Point2D;
import java.awt.Color;
import java.util.Arrays;
import java.util.Iterator;
import javax.swing.JFrame;
import eu.seebetter.ini.chips.DavisChip;
import net.sf.jaer.Description;
import net.sf.jaer.DevelopmentStatus;
import net.sf.jaer.chip.AEChip;
import net.sf.jaer.event.ApsDvsEvent;
import net.sf.jaer.event.ApsDvsEventPacket;
import net.sf.jaer.event.BasicEvent;
import net.sf.jaer.event.EventPacket;
import net.sf.jaer.eventprocessing.EventFilter;
import net.sf.jaer.eventprocessing.EventFilter2D;
import net.sf.jaer.graphics.DavisRenderer;
import net.sf.jaer.graphics.ImageDisplay;
import net.sf.jaer.graphics.ImageDisplay.Legend;

/**
 * Extracts Polarization information. Use
 * <ul>
 * <li>hasNewFrame() to check whether a new frame is available
 * <li>getDisplayBuffer() to get a clone of the latest raw pixel values
 * <li>getNewFrame() to get the latest double buffer of displayed values
 * </ul>
 *
 * @author Damien Joubert inspired by Christian Brändli
 */
@Description("Method to extract polarization information from a stream of APS sample events")
@DevelopmentStatus(DevelopmentStatus.Status.Stable)
public class PolarizationExtractor extends EventFilter2D{

    private JFrame apsFrame = null;
    public ImageDisplay apsDisplay;

    private DavisChip apsChip = null;
    private boolean newFrame, useExtRender = false; // useExtRender means using something like OpenCV to render the
    // data. If false, the displayBuffer is displayed
    private float[] resetBuffer, signalBuffer;
    /**
     * Raw pixel values from sensor, before conversion, brightness, etc.
     */
    private float[] displayBuffer;
    private float[] apsDisplayPixmapBuffer;
    /**
     * Cooked pixel values, after brightness, contrast, log intensity
     * conversion, etc.
     */
    private float[] displayFrame; // format is RGB triplets indexed by ??? what is this? How different than
    public int width, height, maxADC, maxIDX;
    public final float logSafetyOffset = 10000.0f;
    protected boolean showAPSFrameDisplay = getBoolean("showPolarizationFrameDisplay", true);
    private final Legend apsDisplayLegend;
    /**
     * A PropertyChangeEvent with this value is fired when a new frame has been
     * completely read. The oldValue is null. The newValue is the float[]
     * displayFrame that will be rendered.
     */
    public static final String EVENT_NEW_FRAME = DavisRenderer.EVENT_NEW_FRAME_AVAILBLE;
    private int lastFrameTimestamp = -1;
    
    // Diaplay variable between AoP and DoP
    private int offset =0;
    
    // offset of f0, f45, f90 and f135 acording to the index
    private int[] indexf0, indexf45, indexf90, indexf135;

    public static enum Extraction {

        ResetFrame,
        SignalFrame,
        CDSframe
    }

    public Extraction extractionMethod = Extraction.valueOf(getString("extractionMethod", "CDSframe"));

    public PolarizationExtractor(final AEChip chip) {
        super(chip);
        apsDisplay = ImageDisplay.createOpenGLCanvas();
        apsDisplay.addMouseMotionListener(new MouseInfo(apsDisplay));
        apsFrame = new JFrame("Polarization Information DoP - AOP");
        apsFrame.setPreferredSize(new Dimension(800, 800));
        apsFrame.getContentPane().add(apsDisplay, BorderLayout.CENTER);
        apsFrame.pack();
        apsFrame.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(final WindowEvent e) {
                setShowAPSFrameDisplay(false);
            }
        });
        apsDisplayLegend = apsDisplay.addLegend("", 0, 0);
        final float[] displayColor = new float[3];
        displayColor[0] = 1.0f;
        displayColor[1] = 1.0f;
        displayColor[2] = 1.0f;
        apsDisplayLegend.color = displayColor;
        
        initFilter();

        setPropertyTooltip("showPolarizationFrameDisplay", "Shows the JFrame frame display if true");

    }

    @Override
    public void initFilter() {
        resetFilter();
    }

    @Override
    public void resetFilter() {
        if (DavisChip.class.isAssignableFrom(chip.getClass())) {
            apsChip = (DavisChip) chip;
            maxADC = apsChip.getMaxADC();
            newFrame = false;
            width = chip.getSizeX(); // note that on initial construction width=0 because this constructor is called while
            // chip is still being built
            height = chip.getSizeY();
            maxIDX = width * height;
            apsDisplay.setImageSize(width/2, height/2 * 3);
            resetBuffer = new float[maxIDX];
            signalBuffer = new float[maxIDX];
            displayFrame = new float[maxIDX];
            displayBuffer = new float[maxIDX];
            apsDisplayPixmapBuffer = new float[3 * maxIDX / 4 * 3];
            Arrays.fill(resetBuffer, 0.0f);
            Arrays.fill(signalBuffer, 0.0f);
            Arrays.fill(displayFrame, 0.0f);
            Arrays.fill(displayBuffer, 0.0f);
            Arrays.fill(apsDisplayPixmapBuffer, 0.0f);
            offset = (width / 2) * (height / 2) * 6;
            //initialize offsets f0-135
            indexf0 = new int[maxIDX];
            indexf45 = new int[maxIDX];
            indexf90 = new int[maxIDX];
            indexf135 = new int[maxIDX];
            int idx;
            for(int x = 0; x < width; x +=1){
                for(int y = 0; y < height; y+=1){
                    idx = x + y * width;
                    if(x % 2 ==0){
                        if(y % 2 ==0){
                            indexf0[idx] = idx;
                            indexf45[idx] = idx+1;
                            indexf90[idx] = idx+width+1;
                            indexf135[idx] = idx+width;
                        }else{
                            indexf0[idx] = idx-width;
                            indexf45[idx] = idx -width +1;
                            indexf90[idx] = idx+1;
                            indexf135[idx] = idx;
                        }                        
                    }else{
                        if(y % 2 == 0){
                            indexf0[idx] = idx-1;
                            indexf45[idx] = idx;
                            indexf90[idx] = idx+width;
                            indexf135[idx] = idx+width-1;
                        }else{
                            indexf0[idx] = idx-width-1;
                            indexf45[idx] = idx-width;
                            indexf90[idx] = idx;
                            indexf135[idx] = idx-1;
                        }
                    }
                }
            }
            if (width > 0){
                // Display scales 
                // AOP
                float x_0 = width/2;
                float y_0 = height/2 + 30.0f;
                int x, y;
                int aop_rgb, dop_rgb;
                for(float angle = -180.0f; angle < 180.0f; angle +=1.0f){
                    for(float r = 5; r < 25; r+=1){
                        x = (int)( x_0 + r * Math.cos(angle / 180.0f * Math.PI));
                        y = (int)(y_0 + r * Math.sin(angle / 180.0f * Math.PI));
                        idx = (x / 2) + (width / 2) * (y / 2);

                        aop_rgb  = Color.HSBtoRGB(angle/180, 0.9f, 0.9f);
                        apsDisplayPixmapBuffer[3 * idx + offset/2] = ((float)((aop_rgb>>16)&0xFF)) / 255.0f;
                        apsDisplayPixmapBuffer[(3 * idx) + 1 + offset/2] = ((float)((aop_rgb>>8)&0xFF))/ 255.0f;
                        apsDisplayPixmapBuffer[(3 * idx) + 2 + offset/2] = ((float)(aop_rgb&0xFF))/ 255.0f;

                    }
                }

                // DOP
                for(x = width / 2 - 50; x < width/2 + 50; x +=1){
                    for(y = 50; y < 80; y+=1){
                        idx = (x / 2) + (width / 2) * (y / 2);
                        dop_rgb  = Color.HSBtoRGB((x - width / 2 + 50)/100.0f * 0.5f, 0.9f, 0.9f);
                        apsDisplayPixmapBuffer[3 * idx + offset/2] = ((float)((dop_rgb>>16)&0xFF)) / 255.0f;
                        apsDisplayPixmapBuffer[(3 * idx) + 1 + offset/2] = ((float)((dop_rgb>>8)&0xFF))/ 255.0f;
                        apsDisplayPixmapBuffer[(3 * idx) + 2 + offset/2] = ((float)(dop_rgb&0xFF))/ 255.0f;      
                    }
                }
            }
        } else {
            EventFilter.log.warning("The filter ApsFrameExtractor can only be used for chips that extend the ApsDvsChip class");
            return;
        }

    }

    @Override
    public EventPacket<? extends BasicEvent> filterPacket(final EventPacket<? extends BasicEvent> in) {
        checkMaps();

        final ApsDvsEventPacket packet = (ApsDvsEventPacket) in;
        if (packet == null) {
            return null;
        }
        if (packet.getEventClass() != ApsDvsEvent.class) {
            EventFilter.log.warning("wrong input event class, got " + packet.getEventClass() + " but we need to have " + ApsDvsEvent.class);
            return null;
        }
        final Iterator apsItr = packet.fullIterator();
        while (apsItr.hasNext()) {
            final ApsDvsEvent e = (ApsDvsEvent) apsItr.next();
            if (e.isApsData()) {
                putAPSevent(e);
            }
        }

        if (showAPSFrameDisplay) {
            apsDisplay.repaint();
        }
        return in;
    }

    private void checkMaps() {
        apsDisplay.checkPixmapAllocation();
        if (showAPSFrameDisplay && !apsFrame.isVisible()) {
            apsFrame.setVisible(true);
        }
    }

    public void putAPSevent(final ApsDvsEvent e) {
        if (!e.isApsData()) {
            return;
        }
        // if(e.isStartOfFrame())timestampFrameStart=e.timestampFrameStart;
        final ApsDvsEvent.ReadoutType type = e.getReadoutType();
        final float val = e.getAdcSample();
        final int idx = getIndex(e.x, e.y);
        
        if (idx >= maxIDX) {
            return;
        }
        if (e.isStartOfFrame()) {
            if (newFrame && useExtRender) {
                EventFilter.log.warning("new frame started even though old frame was never gotten by anyone calling getNewFrame()");
            }
        }
        if (e.isEndOfFrame()) {
            if (displayBuffer != null && !useExtRender && showAPSFrameDisplay) {
                displayPreBuffer();
            }
            newFrame = true;
            lastFrameTimestamp = e.timestamp;
            getSupport().firePropertyChange(PolarizationExtractor.EVENT_NEW_FRAME, null, displayFrame);
            return;
        }
        switch (type) {
            case SignalRead:
                signalBuffer[idx] = val;
                break;
            case ResetRead:
            default:
                resetBuffer[idx] = val;
                break;
        }
        switch (extractionMethod) {
            case ResetFrame:
                displayBuffer[idx] = resetBuffer[idx];
                break;
            case SignalFrame:
                displayBuffer[idx] = signalBuffer[idx];
                break;
            case CDSframe:
            default:
                if(resetBuffer[idx] > signalBuffer[idx])
                    displayBuffer[idx] = resetBuffer[idx] - signalBuffer[idx];
                else
                    displayBuffer[idx] = 0;
                break;
        }
  
    }
    

    /**
     * Returns timestampFrameStart of last frame, which is the
     * timestampFrameStart of the frame end event
     *
     * @return the timestampFrameStart (usually in us)
     */
    public int getLastFrameTimestamp() {
        return lastFrameTimestamp;
    }

    public void setPixmapArray(final float[] pixmapArray) {
        apsDisplay.setPixmapArray(pixmapArray);
    }

    public void displayPreBuffer() {
        
        double s0, s1, s2, aop, dop;
        int aop_rgb, dop_rgb;
        int idx;
        for(int x = 0; x < width; x +=2){
            for(int y = 0; y < height; y+=2){
                idx = getIndex(x, y);
                s0 =  0.5 * (displayBuffer[indexf0[idx]] + displayBuffer[indexf135[idx]] + displayBuffer[indexf90[idx]] + displayBuffer[indexf45[idx]]);
                s1 = displayBuffer[indexf0[idx]] - displayBuffer[indexf90[idx]]; 
                s2 = displayBuffer[indexf45[idx]] - displayBuffer[indexf135[idx]];
                if( s0 > 0){
                    dop = Math.sqrt(s1*s1 + s2*s2) / s0;
                    aop = (Math.atan2(s2, s1))/ 2.0f ;
                }else{
                    dop = 0;
                    aop =0;
                }

                // Conversion HSV -> RGB
                idx = x / 2 + y / 2 * width / 2;
                
                aop_rgb = Color.HSBtoRGB((float)aop, 0.9f, 0.9f);
                dop_rgb = Color.HSBtoRGB((float)dop*0.5f, 0.9f, 0.9f);
                
                apsDisplayPixmapBuffer[3 * idx] = (float)((dop_rgb>>16)&0xFF) / 255.0f;
                apsDisplayPixmapBuffer[(3 * idx) + 1] = (float)((dop_rgb>>8)&0xFF) / 255.0f;
                apsDisplayPixmapBuffer[(3 * idx) + 2] = (float)((dop_rgb>>0)&0xFF) / 255.0f;
                apsDisplayPixmapBuffer[3 * idx + offset] = (float)((aop_rgb>>16)&0xFF) / 255.0f;
                apsDisplayPixmapBuffer[(3 * idx) + 1 + offset] = (float)((aop_rgb>>8)&0xFF) / 255.0f;
                apsDisplayPixmapBuffer[(3 * idx) + 2 + offset] = (float)((aop_rgb>>0)&0xFF) / 255.0f;
                    
            }
        }
           
        apsDisplay.setPixmapArray(apsDisplayPixmapBuffer);
    }

    /**
     * returns the index <code>y * width + x</code> into pixel arrays for a
     * given x,y location where x is horizontal address and y is vertical and it
     * starts at lower left corner with x,y=0,0 and x and y increase to right
     * and up.
     *
     * @param x
     * @param y
     * @param idx the array index
     * @see #getWidth()
     * @see #getHeight()
     */
    public int getIndex(final int x, final int y) {
        return (y * width) + x;
    }
    

    /**
     * Checks if new frame is available. This flag is reset by getNewFrame()
     *
     * @return true if new frame is available
     * @see #getNewFrame()
     */
    public boolean hasNewFrame() {
        return newFrame;
    }

    /**
     * Returns a float[] buffer of latest displayed frame with adjustments like
     * brightness, contrast, log intensity conversion, etc. The array is indexed
     * by y * width + x. To access a particular pixel, use getIndex(). newFrame
     * is set to false by this call.
     *
     * @return the double[] frame
     * @see #getDisplayBuffer()
     */
    public float[] getNewFrame() {
        newFrame = false;
        return displayFrame;
    }

    /**
     * Returns a clone of the latest float displayBuffer. This buffer contains
     * raw pixel values from sensor, before conversion, brightness, etc. The
     * array is indexed by <code>y * width + x</code>. To access a particular
     * pixel, use getIndex() for convenience. newFrame is set to false by this
     * call.
     *
     * @return the float[] of pixel values
     * @see #getIndex(int, int)
     * @see #getNewFrame()
     */
    public float[] getDisplayBuffer() {
        newFrame = false;
        return displayBuffer.clone();
    }

    /**
     * Tell chip to acquire new frame, return immediately.
     *
     */
    public void acquireNewFrame() {
        apsChip.takeSnapshot();
    }

    /**
     * Sets whether external source sets the displayed data.
     *
     * @param yes true to not fill image values, false to set image values from
     * ApsFrameExtractor
     * @see #setDisplayFrameRGB(float[])
     * @see #setDisplayGrayFrame(double[])
     */
    public void setExtRender(final boolean yes) {
        useExtRender = yes;
    }

    public void setLegend(final String legend) {
        apsDisplayLegend.s = legend;
    }

    public void setDisplayGrayFrame(final double[] frame) {
        int xc = 0;
        int yc = 0;
        for (final double element : frame) {
            apsDisplay.setPixmapGray(xc, yc, (float) element);
            xc++;
            if (xc == width) {
                xc = 0;
                yc++;
            }
        }
    }

    public void setDisplayFrameRGB(final float[] frame) {
        int xc = 0;
        int yc = 0;
        for (int i = 0; i < frame.length; i += 3) {
            apsDisplay.setPixmapRGB(xc, yc, frame[i + 2], frame[i + 1], frame[i]);
            xc++;
            if (xc == width) {
                xc = 0;
                yc++;
            }
        }
    }

 

    /**
     * @param displayBrightness the displayBrightness to set
     */
    public void setDisplayBrightness(final float displayBrightness) {
        resetFilter();
    }

    public Extraction getExtractionMethod() {
        return extractionMethod;
    }

    synchronized public void setExtractionMethod(final Extraction extractionMethod) {
        getSupport().firePropertyChange("extractionMethod", this.extractionMethod, extractionMethod);
        putString("edgePixelMethod", extractionMethod.toString());
        this.extractionMethod = extractionMethod;
        resetFilter();
    }

    /**
     * @return the showAPSFrameDisplay
     */
    public boolean isShowAPSFrameDisplay() {
        return showAPSFrameDisplay;
    }

    /**
     * @param showAPSFrameDisplay the showAPSFrameDisplay to set
     */
    public void setShowAPSFrameDisplay(final boolean showAPSFrameDisplay) {
        this.showAPSFrameDisplay = showAPSFrameDisplay;
        putBoolean("showAPSFrameDisplay", showAPSFrameDisplay);
        if (apsFrame != null) {
            apsFrame.setVisible(showAPSFrameDisplay);
        }
        getSupport().firePropertyChange("showAPSFrameDisplay", null, showAPSFrameDisplay);
    }

    @Override
    public synchronized void setFilterEnabled(final boolean yes) {
        super.setFilterEnabled(yes); // To change body of generated methods, choose Tools | Templates.
        if (!isFilterEnabled()) {
            if (apsFrame != null) {
                apsFrame.setVisible(false);
            }
        }
    }

    /**
     * returns frame width in pixels.
     *
     * @return the width
     */
    public int getWidth() {
        return width;
    }

    /**
     * returns frame height in pixels
     *
     * @return the height
     */
    public int getHeight() {
        return height;
    }

    /**
     * returns max ADC value
     *
     * @return the maxADC
     */
    public int getMaxADC() {
        return maxADC;
    }

    /**
     * returns max index into frame buffer arrays
     *
     * @return the maxIDX
     */
    public int getMaxIDX() {
        return maxIDX;
    }


    private class MouseInfo extends MouseMotionAdapter {

        ImageDisplay apsImageDisplay;

        public MouseInfo(final ImageDisplay display) {
            apsImageDisplay = display;
        }

        @Override
        public void mouseMoved(final MouseEvent e) {
            final Point2D.Float p = apsImageDisplay.getMouseImagePosition(e);
            if ((p.x >= 0) && (p.x < chip.getSizeX()) && (p.y >= 0) && (p.y < chip.getSizeY())) {
                final int idx = getIndex((int) p.x, (int) p.y);
                EventFilter.log.info(String.format("reset= %d, signal= %d, reset-signal= %+d", (int) resetBuffer[idx],
                        (int) signalBuffer[idx], (int) (resetBuffer[idx] - signalBuffer[idx])));
            }
        }
    }
}
