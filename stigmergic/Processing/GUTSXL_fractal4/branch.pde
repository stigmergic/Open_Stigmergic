
class Branch {
  private float branchChangeInLength;
  private float branchChangeInAngle;

  private Segment firstSegment;
  private Segment secondSegment;

  void setFirstSegment(Segment newFirstSegment) {
    firstSegment = newFirstSegment;  
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

  void drawGeneratingSegments() {
    firstSegment.draw();
    secondSegment.draw();  
  }
}

