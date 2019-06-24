import java.util.*;import java.awt.*;import java.awt.event.*;import java.applet.*;import javax.swing.*;
 // Author = Awillis4
 // Contributors: MadProgrammer,Beerkay,ntejuco
import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Point;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;//retained for posterity

public class cores {

    public static class Grid extends JPanel{private List<Point> fillCells;

        public Grid(){fillCells=new ArrayList<>(49);}

        @Override
        protected void paintComponent(Graphics g) {super.paintComponent(g);
            for (Point fillCell : fillCells) {
                int cellX=fillCell.x;int cellY=fillCell.y;
                g.setColor(Color.YELLOW);
                g.fillRect(cellX+100,cellY+100,200,200);g.fillRect(cellX+400,cellY+100,200,200);
                g.fillRect(cellX+100,cellY+400,200,200);g.fillRect(cellX+400,cellY+400,200,200);
                g.setColor(Color.PINK);
                g.fillRect(cellX+300,cellY+100,100,200);g.fillRect(cellX+300,cellY+400,100,200);
                g.fillRect(cellX+100,cellY+300,200,100);g.fillRect(cellX+400,cellY+300,200,100);
                g.setColor(Color.GRAY);
                g.fillRect(cellX+0,cellY+0,100,700);g.fillRect(cellX+0,cellY+0,700,100);
                g.fillRect(cellX+0,cellY+600,700,100);g.fillRect(cellX+600,cellY+0,100,700);
                g.setColor(Color.GREEN);
                g.fillRect(cellX+200,cellY+0,300,100);g.fillRect(cellX+0,cellY+200,100,300);
                g.fillRect(cellX+600,cellY+200,100,300);g.fillRect(cellX+200,cellY+600,300,100);
                g.setColor(Color.BLACK);g.drawRect(0,0,700,700);
                g.setColor(Color.RED);g.fillRect(cellX+300,cellY+300,100,100);}

            for (int i = 0; i <= 700; i += 100) {g.drawRect(0, 0, 0, 100);}
            for (int i = 0; i <= 700; i += 100) {g.drawRect(0, 0, 100, 0);}         }

        public void fillCell(int x, int y) {fillCells.add(new Point(x, y));repaint();}}

    public static void main(String[] a) {EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                try {UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());}
                catch (ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException ex) {}

                Grid grid = new Grid();JFrame window = new JFrame();
                window.setSize(750, 750);window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                window.add(grid);window.setVisible(true);
                grid.fillCell(2,2);grid.fillCell(2,3);grid.fillCell(3,2);grid.fillCell(3,3);
                grid.fillCell(5,2);grid.fillCell(5,3);grid.fillCell(6,2);grid.fillCell(6,3);
                grid.fillCell(2,5);grid.fillCell(2,6);grid.fillCell(3,5);grid.fillCell(3,6);
                grid.fillCell(5,5);grid.fillCell(5,6);grid.fillCell(6,5);grid.fillCell(6,6);
                grid.fillCell(4, 4); 
                }}); }}