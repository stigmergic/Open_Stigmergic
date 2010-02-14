
class Follower {
  float x, y;
  float dx, dy;
  float friction = 0.95;
  color c;
  float d = 10;

  void step() {
    float ax = mouseX - x;
    float ay = mouseY - y;
    float distance = sqrt(sq(ax) + sq(ay));
    
    if (distance>1) {
      ax = ax / (distance);
      ay = ay / (distance);
    }
    
    dx += ax;
    dy += ay;
    
    dx *= friction;
    dy *= friction;
    
    x += dx;
    y += dy;
    
    //x = constrain(x, 0, width);
    //y = constrain(y, 0, height);
  }
  
  void draw() {
    noStroke();
    fill(c);
    ellipse(x,y,d,d);
  }
}
