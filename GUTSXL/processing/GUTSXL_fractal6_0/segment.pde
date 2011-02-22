
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
  
  void rotate(float angle) {
    float myLength = getLength();
    float myAngle = getAngle();
  
    endX = startX + myLength * cos(angle + myAngle);
    endY = startY + myLength * sin(angle + myAngle);
  }
  
  void lengthen(float addLength) {
    float myLength = getLength();
    float myAngle = getAngle();
  
    endX = startX + (myLength + addLength) * cos(myAngle);
    endY = startY + (myLength + addLength) * sin(myAngle);    
  }
  
  void setupColor() {
    float f = (height/8)/sq(getLength());
    f = constrain(f, 0.0, 0.8);
    if (drawgrayscale) {
      stroke( 255 - ((f)*255 + (1-f)*255), blur ? 10 : 255);
    } else {
      stroke((1-f)*255, (f)*255 + (1-f)*255, 0, blur ? 10 : 255);
    }    
  }
  
  void drawInBox(float x, float y, float boxWidth, float boxHeight) {
    float scaleX = boxWidth / width;
    float scaleY = boxHeight / height;
    line(x + startX * scaleX, y + startY * scaleY, x + endX * scaleX, y + endY * scaleY);      
  }
  
  void draw() {
    setupColor();
    drawInBox(0,0,width,height);
  }
  
}
