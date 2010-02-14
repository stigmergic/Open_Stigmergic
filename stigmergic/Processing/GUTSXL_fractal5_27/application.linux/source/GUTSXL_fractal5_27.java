import processing.core.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class GUTSXL_fractal5_27 extends PApplet {float firstSegmentLength;
int numLevels = 6;

long numCalls = 0;

Branch branch1;
Branch branch2;

public void setup() {
  //size(600,600);
  size(1680,1050);
  background(0);

  Segment firstSegment = new Segment(width/2, height, width/2, height - height/4);
  firstSegmentLength = firstSegment.getLength();
  branch1 = new Branch();
  branch1.setFirstSegment(firstSegment);
  branch1.makeNewSecondSegment(width/2 + height/16, height - height/4);
  branch2 = new Branch();
  branch2.setFirstSegment(firstSegment);
  branch2.makeNewSecondSegment(width/2 - height/16, height - height/4);
}

public void draw() {
  if (mousePressed) background(0);

  branch1.calcBranch();

  branch2.calcBranch();

  int c = color(255,255,0);
  fill(c); 
  stroke(c);
  branch1.drawGeneratingSegments();
  branch2.drawGeneratingSegments();

  numCalls = 0;

  noFill();
  //ellipse(width/2, height-height/4, firstSegmentLength*2, firstSegmentLength*2);
  stroke(255);
  if (random(1.0f) < 0.5f) { 
    drawTree(branch1, branch2, branch1.getSecondSegment(), numLevels);
    drawTree(branch1, branch2, branch2.getSecondSegment(), numLevels);
  } 
  else {
    drawTree(branch1, branch2, branch2.getSecondSegment(), numLevels);
    drawTree(branch1, branch2, branch1.getSecondSegment(), numLevels);
  }
  //drawSegments(branch2, branch2.getSecondSegment(), numLevels);

  println("Num Calls: " + numCalls);
}

public void drawSegments(Branch branch1, Segment lastSegment, int level) {
  numCalls += 1;
  Segment nextSegment = branch1.getNextSegment(lastSegment);
  nextSegment.draw();

  if (nextSegment.getLength()<1) return;
  if (level > 0) drawSegments(branch1, nextSegment, level - 1);  
} 

public void drawTree(Branch branch1, Branch branch2, Segment lastSegment, int level) {
  numCalls += 1;
  if (numCalls>10000) return;
  Segment nextSegment;

  float limit = 2.0f;

  if (random(1.0f) < 0.5f) { 
    nextSegment = branch1.getNextSegment(lastSegment);
    nextSegment.draw();
    if (nextSegment.getLength() > limit && level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  

    nextSegment = branch2.getNextSegment(lastSegment);
    nextSegment.draw();
    if (nextSegment.getLength() > limit && level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  
  } 
  else {
    nextSegment = branch2.getNextSegment(lastSegment);
    nextSegment.draw();
    if (nextSegment.getLength() > limit && level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  

    nextSegment = branch1.getNextSegment(lastSegment);
    nextSegment.draw();
    if (nextSegment.getLength() > limit && level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  

  }
  //What do we need to do here?
}


class Branch {
  private float branchChangeInLength;
  private float branchChangeInAngle;

  private Segment firstSegment;
  private Segment secondSegment;

  public void setFirstSegment(Segment newFirstSegment) {
    firstSegment = newFirstSegment;  
  }

  public Segment getFirstSegment() {
    return firstSegment;  
  }

  public Segment getSecondSegment() {
    return secondSegment;
  }

  public void setSecondSegment(Segment newSecondSegment) {
    secondSegment = newSecondSegment;  
  }

  public void makeNewSecondSegment(float x, float y) {
    setSecondSegment(firstSegment.makeNewSegmentTo(x,y));  
  }

  public void calcBranch() {
    branchChangeInLength = secondSegment.getLength() / firstSegment.getLength();
    branchChangeInAngle = secondSegment.getAngle() - firstSegment.getAngle();
  }

  public Segment getNextSegment(Segment lastSegment) {
    float newLength = lastSegment.getLength() * branchChangeInLength;
    float newAngle = lastSegment.getAngle() + branchChangeInAngle;
    float newStartX = lastSegment.endX;
    float newStartY = lastSegment.endY;
    float newEndX = newStartX + cos(newAngle) * newLength;
    float newEndY = newStartY + sin(newAngle) * newLength;

    return new Segment(newStartX, newStartY, newEndX, newEndY);
  }

  public void drawGeneratingSegments() {
    firstSegment.draw();
    secondSegment.draw();  
  }

}

boolean moveBranch1 = true;

public void keyPressed() {
  switch (key) {
    case '<':
      numLevels = max(0, numLevels-1);
      println("Number of levels: " + numLevels);
      break;
    case '>':
      numLevels = numLevels+1;
      println("Number of levels: " + numLevels);
      break;
    
    default:
      println("KeyPressed: <" + key + ">");    
  
  }  
}


class Segment {
  private float startX, startY, endX, endY;
  
  public Segment(float startX, float startY, float endX, float endY) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;   
  }
  
  public float getLength() {
    return sqrt(sq(endX - startX) + sq(endY - startY));
  }  
  
  public float getAngle() {
    return atan2(endY-startY, endX-startX);  
  }
  
  public Segment makeNewSegmentTo(float x, float y) {
    return new Segment(endX, endY, x, y);  
  }
  
  public void draw() {
    float f = (height/8)/sq(getLength());
    f = constrain(f, 0.0f, 0.8f);
    stroke((1-f)*255, (f)*255 + (1-f)*255, 0, 20);
    line(startX, startY, endX, endY);  
  }
  
}
  static public void main(String args[]) {     PApplet.main(new String[] { "GUTSXL_fractal5_27" });  }}