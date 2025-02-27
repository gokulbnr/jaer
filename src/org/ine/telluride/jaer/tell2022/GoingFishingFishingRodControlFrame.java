/*
 * Copyright (C) 2022 tobid.
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
package org.ine.telluride.jaer.tell2022;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.util.logging.Logger;
import javax.swing.JPanel;

/**
 *
 * @author tobid
 */
public class GoingFishingFishingRodControlFrame extends javax.swing.JFrame {

    static Logger log = Logger.getLogger("GoingFishing");

    private long lastTimeMs = 0;
    private boolean recording = false;
    RodSequence rodSequence = null;
    int lastX = -1, lastY = -1;
    int startX = -1, startY = -1;
    int collectorX = -1, collectorY = -1;
    JPanel myPanel = null;
    private boolean shiftPressed = false;
    private RodPosition lastRodPosition = null;

    /**
     * Creates new form GoingFishingFishingRodControlFrame
     */
    public GoingFishingFishingRodControlFrame() {
        initComponents();
        myPanel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                if (startX != -1 && startY != -1) {
                    final int s = 8;
                    g.setColor(Color.red);
                    g.drawLine(startX - s, startY, startX + s, startY);
                    g.drawLine(startX, startY - s, startX, startY + s);
                }
                if (lastY != -1 && lastX != -1) {
                    final int s = 8;
                    g.setColor(Color.blue);
                    g.drawLine(lastX - s, lastY, lastX + s, lastY);
                    g.drawLine(lastX, lastY - s, lastX, lastY + s);
                }
            }
        };
        myPanel.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            @Override
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                processMouseEvent(evt, false, false);
            }
        });
        myPanel.addKeyListener(new java.awt.event.KeyAdapter() {
            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                if (evt.getKeyCode() == KeyEvent.VK_SHIFT) {
                    shiftPressed = true;
                    log.info("shift pressed");
                } else {
                    toggleRecording(evt);
                }
            }

            @Override
            public void keyReleased(KeyEvent evt) {
                if (evt.getKeyCode() == KeyEvent.VK_SHIFT) {
                    shiftPressed = false;
                    log.info("shift released");
                }
            }

            @Override
            public void keyTyped(java.awt.event.KeyEvent evt) {
                toggleRecording(evt);
            }
        });
        myPanel.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mousePressed(java.awt.event.MouseEvent evt) {
                processMouseEvent(evt, false, false);
            }
        });
        rodControlPanel.add(myPanel, BorderLayout.CENTER);
        myPanel.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                processMouseEvent(evt, false, true);
            }
        });
        rodControlPanel.add(myPanel, BorderLayout.CENTER);

        buttonGroup1.add(fishingHoleButton0);
        buttonGroup1.add(fishingHoleButton1);
        buttonGroup1.add(fishRemoverButton);
        fishingHoleButton0.setSelected(true);
        pack();

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        jPanel2 = new javax.swing.JPanel();
        rodControlPanel = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        fishingHoleButton0 = new javax.swing.JRadioButton();
        fishingHoleButton1 = new javax.swing.JRadioButton();
        fishRemoverButton = new javax.swing.JRadioButton();
        clearButton = new javax.swing.JButton();
        recordToggleButton = new javax.swing.JToggleButton();
        dipRodButton = new javax.swing.JButton();
        helpText = new javax.swing.JTextField();

        setTitle("Going Fishing Rod Control");
        addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                formKeyTyped(evt);
            }
            public void keyPressed(java.awt.event.KeyEvent evt) {
                formKeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                formKeyReleased(evt);
            }
        });

        jPanel2.setLayout(new java.awt.BorderLayout());

        rodControlPanel.setBackground(new java.awt.Color(102, 204, 255));
        rodControlPanel.setBorder(new javax.swing.border.MatteBorder(null));
        rodControlPanel.setMinimumSize(new java.awt.Dimension(400, 400));
        rodControlPanel.setLayout(new java.awt.BorderLayout());
        jPanel2.add(rodControlPanel, java.awt.BorderLayout.CENTER);

        jPanel1.setLayout(new javax.swing.BoxLayout(jPanel1, javax.swing.BoxLayout.LINE_AXIS));

        fishingHoleButton0.setText("Fishing hole 0");
        fishingHoleButton0.setToolTipText("Record hole 0 sequence");
        jPanel1.add(fishingHoleButton0);

        fishingHoleButton1.setText("Fishing hole 1");
        fishingHoleButton1.setToolTipText("Record fishing hole 1 sequence");
        jPanel1.add(fishingHoleButton1);

        fishRemoverButton.setText("Fish remover");
        fishRemoverButton.setToolTipText("Record seqeunce to shake off fish");
        jPanel1.add(fishRemoverButton);

        clearButton.setText("Clear all");
        clearButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                clearButtonActionPerformed(evt);
            }
        });
        jPanel1.add(clearButton);

        recordToggleButton.setText("Record (r)");
        recordToggleButton.setToolTipText("Toggle recording of fishing rod movement");
        recordToggleButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                recordToggleButtonActionPerformed(evt);
            }
        });
        jPanel1.add(recordToggleButton);

        dipRodButton.setText("Dip");
        dipRodButton.setToolTipText("Try the rod dip");
        dipRodButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                dipRodButtonActionPerformed(evt);
            }
        });
        jPanel1.add(dipRodButton);

        helpText.setEditable(false);
        helpText.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        helpText.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        helpText.setText("Press left mouse button and drag to control rod.");
        helpText.setToolTipText("\"r\" toggles recording. Use clicks for zero delay. Hold Shift to constrain vertically. ESC aborts recording.");
        helpText.setFocusable(false);
        jPanel1.add(helpText);

        jPanel2.add(jPanel1, java.awt.BorderLayout.SOUTH);

        getContentPane().add(jPanel2, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    protected void processMouseEvent(MouseEvent evt, boolean start, boolean click) {
        // first drag movement of mouse starts the sequencq
        requestFocusInWindow(); // to get key listeners to work
        if (start) {
            startX = evt.getX();
            startY = evt.getY();
        } else {
            lastX = shiftPressed ? lastX : evt.getX();  // if shift held down, keep x fixed to constrain vertical rod movement
            lastY = evt.getY();
        }
        float thetaDeg = (180f * (float) lastX / myPanel.getWidth());
        int zDeg = (int) (Math.floor(180f * (float) (myPanel.getHeight() - lastY) / myPanel.getHeight()));
        final long currentTimeMillis = System.currentTimeMillis();
        long delayToNextMs = lastTimeMs == 0 ? 0 : currentTimeMillis - lastTimeMs;
        if (click) {
            delayToNextMs = 0;
        }

        // first step has zero delay
        RodPosition rodPosition = new RodPosition(delayToNextMs, thetaDeg, zDeg);
        if (recording) {
            rodSequence.add(rodPosition);
            log.info("added " + rodPosition.toString());
        }
        lastTimeMs = currentTimeMillis;
        lastRodPosition = rodPosition;
        firePropertyChange(GoingFishing.EVENT_ROD_POSITION, null, rodPosition);
        repaint(30);
    }


    private void recordToggleButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_recordToggleButtonActionPerformed
        toggleRecording();
    }//GEN-LAST:event_recordToggleButtonActionPerformed

    private void formKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_formKeyTyped
        toggleRecording(evt);
    }//GEN-LAST:event_formKeyTyped

    private void clearButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_clearButtonActionPerformed
        firePropertyChange(GoingFishing.EVENT_CLEAR_SEQUENCES, null, null);
    }//GEN-LAST:event_clearButtonActionPerformed

    private void dipRodButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_dipRodButtonActionPerformed
        firePropertyChange(GoingFishing.EVENT_DIP_ROD, null, null);
    }//GEN-LAST:event_dipRodButtonActionPerformed

    private void formKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_formKeyPressed
        switch (evt.getKeyCode()) {
            case KeyEvent.VK_SHIFT:
                shiftPressed = true;
                log.info("form shift pressed");
                break;
        }
    }//GEN-LAST:event_formKeyPressed

    private void formKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_formKeyReleased
        switch (evt.getKeyCode()) {
            case KeyEvent.VK_SHIFT:
                shiftPressed = false;
                log.info("form shift released");
                break;
            case KeyEvent.VK_ESCAPE:
                abortRecording();
                break;
        }
    }//GEN-LAST:event_formKeyReleased

    private void toggleRecording(KeyEvent evt) {
        switch (evt.getKeyChar()) {
            case 'r':
                recordToggleButton.setEnabled(!recordToggleButton.isEnabled());
                toggleRecording();
                break;
        }
    }

    synchronized private void abortRecording() {
        if (recording) {
            recording=false;
            if(rodSequence!=null){
                rodSequence.clear();
            }
            log.info("aborted recording");
        }
    }

    synchronized private void toggleRecording() {
        recording = !recording;
        if (recording) {
            lastTimeMs = 0;
            String name = "";
            if (fishingHoleButton0.isSelected()) {
                name = GoingFishing.SEQ_HOLE_0;
            } else if (fishingHoleButton1.isSelected()) {
                name = GoingFishing.SEQ_HOLE_1;
            } else if (fishRemoverButton.isSelected()) {
                name = GoingFishing.SEQ_FISH_REMOVER;
            } else {
                throw new RuntimeException("no sequence selected to record, should not occur");
            }

            rodSequence = new RodSequence(name);
            log.info("recording sequence " + name);
        } else {
            firePropertyChange(GoingFishing.EVENT_ROD_SEQUENCE, null, rodSequence);
        }
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(GoingFishingFishingRodControlFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(GoingFishingFishingRodControlFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(GoingFishingFishingRodControlFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GoingFishingFishingRodControlFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new GoingFishingFishingRodControlFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JButton clearButton;
    private javax.swing.JButton dipRodButton;
    private javax.swing.JRadioButton fishRemoverButton;
    private javax.swing.JRadioButton fishingHoleButton0;
    private javax.swing.JRadioButton fishingHoleButton1;
    private javax.swing.JTextField helpText;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JToggleButton recordToggleButton;
    private javax.swing.JPanel rodControlPanel;
    // End of variables declaration//GEN-END:variables

}
