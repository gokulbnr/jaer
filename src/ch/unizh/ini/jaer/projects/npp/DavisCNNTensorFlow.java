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
import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.nio.FloatBuffer;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import javax.swing.JFrame;
import net.sf.jaer.graphics.AEFrameChipRenderer;
import org.tensorflow.Graph;
import org.tensorflow.Operation;
import org.tensorflow.Output;
import org.tensorflow.Shape;
import org.tensorflow.Tensor;

/**
 * Runs a CNN using tensorflow
 *
 * https://www.tensorflow.org/api_docs/java/reference/org/tensorflow/package-summary
 *
 * https://www.tensorflow.org/install/
 *
 * @author Tobi
 */
public class DavisCNNTensorFlow extends AbstractDavisCNN {


    protected OutputLayer outputLayer = null;
    protected InputLayer inputLayer = null;

    private byte[] graphDef = null;
    private Graph executionGraph = null;
    private Graph inputProcessingGraph = null;

    public DavisCNNTensorFlow(AbstractDavisCNNProcessor processor) {
        super(processor);
    }

    @Override
    public float[] processDvsTimeslice(DvsFramer.DvsFrame frame) {
        FloatBuffer b = FloatBuffer.wrap(frame.getImage());
        return executeGraph(b, frame.getWidth(), frame.getHeight());
    }

    @Override
    public float[] processDownsampledFrame(AEFrameChipRenderer frame) {
        FloatBuffer b = frame.getPixmap();
        return executeGraph(b, frame.getWidth(), frame.getHeight());
    }

    //https://github.com/tensorflow/tensorflow/blob/master/tensorflow/java/src/main/java/org/tensorflow/op/Operands.java
    // https://github.com/tensorflow/tensorflow/issues/7149
    private float[] executeGraph(FloatBuffer pixbuf, int width, int height) {
        int numChannels = makeRGBFrames ? 3 : 1;
        inputLayer = new InputLayer(width, height, numChannels); // TODO hack since we don't know the input size yet until network runs
        if (makeRGBFrames) {
            FloatBuffer rgbbuf = FloatBuffer.allocate(pixbuf.limit() * numChannels);
            rgbbuf.put(pixbuf);
            pixbuf.rewind();
            rgbbuf.put(pixbuf);
            pixbuf.rewind();
            rgbbuf.put(pixbuf);
            rgbbuf.rewind();
            pixbuf = rgbbuf; // copy the 3 frames sequentially, really dumb
        }
        try (Tensor<Float> imageTensor = Tensor.create(new long[]{1, height, width, numChannels}, pixbuf);) {
            float[] output = TensorFlow.executeGraph(executionGraph, imageTensor, processor.getInputLayerName(), processor.getOutputLayerName());
            outputLayer = new OutputLayer(output);
//            if(labels!=null){
//                log.info(
//                        String.format("BEST MATCH: %s (%.2f%% likely)",
//                                labels.get(outputLayer.maxActivatedUnit),
//                                outputLayer.labelProbabilities[outputLayer.maxActivatedUnit] * 100f));
//            }
            return output;
        }
    }

    @Override
    public float[] processInputPatchFrame(AEFrameChipRenderer frame, int offX, int offY) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public InputLayer getInputLayer() {
        return inputLayer;
    }

    @Override
    public OutputLayer getOutputLayer() {
        return outputLayer;
    }

    @Override
    public void drawActivations() {
    }

    @Override
    public void cleanup() {
        if (executionGraph != null) {
            executionGraph.close();
        }
        if (inputProcessingGraph != null) {
            inputProcessingGraph.close();
        }
    }

    @Override
    public JFrame drawKernels() {
        throw new UnsupportedOperationException("not supported yet");
    }

    @Override
    public void loadNetwork(File f) throws IOException {
        if(f==null) throw new IOException("null file");
        try {
            setFilename(f.toString());
            setNettype("TensorFlow");
            setNetname(f.getName());
            graphDef = Files.readAllBytes(Paths.get(f.getAbsolutePath())); // "tensorflow_inception_graph.pb"
            executionGraph = new Graph();
            executionGraph.importGraphDef(graphDef);
            Iterator<Operation> itr = executionGraph.operations();
            StringBuilder b = new StringBuilder("TensorFlow Graph: \n");
            int opnum = 0;
            while (itr.hasNext()) {
                Operation o = itr.next();
                final String s = o.toString().toLowerCase();
//                if(s.contains("input") || s.contains("output") || s.contains("placeholder")){
                if (s.contains("input") || s.contains("placeholder") || s.contains("output")) {  // find input placeholder & output
                    int numOutputs = o.numOutputs();
                    b.append("********** ");
//                    for (int onum = 0; onum < numOutputs; onum++) {
//                        Output output = o.output(onum);
//                        Shape shape = output.shape();
//                        int numDimensions = shape.numDimensions();
//                        for (int dimidx = 0; dimidx < numDimensions; dimidx++) {
//                            long dim = shape.size(dimidx);
//                        }
//                    }
//                    int inputLength=o.inputListLength("");
                }
                b.append(opnum++ + ": " + o.toString() + "\n");
            }
            log.info(b.toString());
        } catch (Exception e) {
            log.warning(e.toString());
            e.printStackTrace();
        }
    }

    @Override
    public void printActivations() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void printWeights() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public class OutputLayer implements AbstractDavisCNN.OutputLayer {

        float[] labelProbabilities;
        int maxActivatedUnit;
        float maxActivation;
        int numUnits;

        public OutputLayer(float[] output) {
            labelProbabilities = output;
            numUnits = output.length;
            maxActivatedUnit = TensorFlow.maxIndex(output);
            maxActivation = output[maxActivatedUnit];
        }

        @Override
        public int getNumUnits() {
            return numUnits;
        }

        @Override
        public int getMaxActivatedUnit() {
            return maxActivatedUnit;
        }

        @Override
        public void setMaxActivatedUnit(int unit) {
            maxActivatedUnit = unit;
        }

        @Override
        public float getMaxActivation() {
            return maxActivation;
        }

        @Override
        public void drawHistogram(GL2 gl, int width, int height, float lineWidth, Color color) {
            AbstractDavisCNN.drawHistogram(gl, labelProbabilities, width, height, lineWidth, color);
        }

        @Override
        public float[] getActivations() {
            return labelProbabilities;
        }

    }

    public class InputLayer implements AbstractDavisCNN.InputLayer {

        int height, width, numChannels;

        public InputLayer(int width, int height, int numChannels) {
            this.width = width;
            this.height = height;
            this.numChannels = numChannels;
        }

        @Override
        public int getWidth() {
            return width;
        }

        @Override
        public int getHeight() {
            return height;
        }

        @Override
        public int getNumChannels() {
            return numChannels;
        }

    }

}
