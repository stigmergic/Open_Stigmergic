
class Segment {
  private float startX, startY, endX, endY;
  
  public Segment(float startX, float startY, float endX, float endY) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;   
  }
  
  float getLength() {
    return sqrt(sq(endX - startX) + sq(endY - startY));
  }  
  
  float getAngle() {
    return atan2(endY-startY, endX-startX);  
  }
  
  Segment makeNewSegmentTo(float x, float y) {
    return new Segment(endX, endY, x, y);  
  }
  
  void draw() {
    line(startX, startY, endX, endY);  
  }
  
}
