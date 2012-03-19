/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ch.unizh.ini.jaer.projects.spatiatemporaltracking.tracker.feature.implementations.signal.autocorrelation;

import ch.unizh.ini.jaer.projects.spatiatemporaltracking.data.correlation.CorrelationStorage;
import ch.unizh.ini.jaer.projects.spatiatemporaltracking.tracker.feature.Features;
import ch.unizh.ini.jaer.projects.spatiatemporaltracking.tracker.feature.implementations.AbstractFeatureExtractor;
import ch.unizh.ini.jaer.projects.spatiatemporaltracking.tracker.feature.manager.FeatureManager;
import ch.unizh.ini.jaer.projects.spatiatemporaltracking.parameter.ParameterManager;
import ch.unizh.ini.jaer.projects.spatiatemporaltracking.util.Color;
import com.sun.opengl.util.j2d.TextRenderer;
import javax.media.opengl.GLAutoDrawable;
import javax.media.opengl.GL;
import net.sf.jaer.chip.AEChip;

/**
 *
 * @author matthias
 * 
 * The concrete implementations of this class have to extract the auto 
 * correlation function out of the data provided by the observed object. 
 */
public abstract class AbstractAutoCorrelationExtractor extends AbstractFeatureExtractor implements AutoCorrelationExtractor {
    
    /** Determines the number of latency for which the extractor will compute the auto correlation. */
    public final int nObservations = 20;
    
    /** 
     * Stores the values computed using the auto correlation function and the
     * corresponding latencies.
     */
    protected CorrelationStorage correlation;
    
    /** Just used for the drawing. Stores a correlation to draw it. */
    protected CorrelationStorage drawing;
    
    /**
     * Creates a new instance of a AbstractAutoCorrelationExtractor.
     */
    public AbstractAutoCorrelationExtractor (Features interrupt,
                                             ParameterManager parameters, 
                                             FeatureManager features,
                                             AEChip chip) {
        super(interrupt, parameters, features, Features.AutoCorrelation, Color.getBlue(), chip);
        
        this.init();
        this.reset();
    }
    
    @Override
    public void init() {
        super.init();
    }

    @Override
    public void reset() {
        super.reset();
        
        this.drawing = null;
    }
    
    @Override
    public CorrelationStorage getCorrelation() {
        return this.correlation;
    }
    
    @Override
    public void draw(GLAutoDrawable drawable, TextRenderer renderer, float x, float y) {
        if (this.drawing == null) return;
        
        if (this.isDebugged) {
            GL gl = drawable.getGL();
            gl.glColor3d(0, 0, 1.0);

            CorrelationStorage s = this.drawing;

            float max = 0;
            for (int i = 0; i < s.getObservations(); i++) {
                if (max < s.getItems()[i].score) {
                    max = s.getItems()[i].score;
                }
            }

            int offset = s.getItems()[0].value;
            float pack = 100.0f / (s.getItems()[s.getObservations() - 1].value - offset);
            for (int i = 0; i < this.nObservations - 1 ; i++) {
                float start = (s.getItems()[i].value - offset) * pack;
                float end = (s.getItems()[i + 1].value - offset) * pack;

                float state = s.getItems()[i].score / max * ((this.getHeight() - 5) / 2.0f);
                float transition = s.getItems()[i + 1].score / max * ((this.getHeight() - 5) / 2.0f);

                gl.glBegin(GL.GL_LINES);
                {
                    gl.glVertex2f(x + start, y - this.getHeight() / 2.0f + state + 1);
                    gl.glVertex2f(x + end, y - this.getHeight() / 2.0f + state + 1);
                }
                gl.glEnd();

                gl.glBegin(GL.GL_LINES);
                {
                    gl.glVertex2f(x + end, y - this.getHeight() / 2.0f + state + 1);
                    gl.glVertex2f(x + end, y - this.getHeight() / 2.0f + transition + 1);
                }
                gl.glEnd();
            }

            renderer.begin3DRendering();
            renderer.setColor(0,0,1,0.8f);
            renderer.draw3D("auto correlation [au]: 0, " + (this.drawing.getItems()[this.drawing.getObservations() - 1].value) + ".", x, y, 0, 0.5f);
            renderer.end3DRendering();
        }
    }

    @Override
    public int getHeight() {
        if (this.isDebugged) return 10;
        return 0;
    }
}
