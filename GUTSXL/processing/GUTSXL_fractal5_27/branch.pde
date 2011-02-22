
class Branch {
  private float branchChangeInLength;
  private float branchChangeInAngle;

  private Segment firstSegment;
  private Segment secondSegment;

  void setFirstSegment(Segment newFirstSegment) {
    firstSegment = newFirstSegment;  
  }

  Segment getFirstSegment() {
    return firstSegment;  
  }

  Segment getSecondSegment() {
    return secondSegment;
  }

  void setSecondSegment(Segment newSecondSegment) {
    secondSegment = newSecondSegment;  
  }

  void makeNewSecondSegment(float x, float y) {
    setSecondSegment(firstSegment.makeNewSegmentTo(x,y));  
  }

  void calcBranch() {
    branchChangeInLength = secondSegment.getLength() / firstSegment.getLength();
    branchChangeInAngle = secondSegment.getAngle() - firstSegment.getAngle();
  }

  Segment getNextSegment(Segment lastSegment) {
    float newLength = lastSegment.getLength() * branchChangeInLength;
    float newAngle = lastSegment.getAngle() + branchChangeInAngle;
    float newStartX = lastSegment.endX;
    float newStartY = lastSegment.endY;
    float newEndX = newStartX + cos(newAngle) * newLength;
    float newEndY = newStartY + sin(newAngle) * newLength;

    return new Segment(newStartX, newStartY, newEndX, newEndY);
  }

  void drawGeneratingSegments(color genColor) {
    firstSegment.draw();
    secondSegment.draw();

    noFill();
    stroke(genColor);
        
    firstSegment.drawInBox(0,0,100,100);
    secondSegment.drawInBox(0,0,100,100);
    ellipse(50,75,50,50);
    rect(0,0,100,100);  
  }

}

