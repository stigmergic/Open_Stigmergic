
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
    float f = height/16/getLength();
    f = constrain(f, 0.0, 1.0);
    stroke((1-f)*255, (f)*255 + (1-f)*255, 0);
    line(startX, startY, endX, endY);  
  }
  
}
