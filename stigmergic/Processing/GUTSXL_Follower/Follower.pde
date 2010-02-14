
class Follower {
  float x, y;
  float dx, dy;
  float friction = 0.95;

  void step() {
    float ax = mouseX - x;
    float ay = mouseY - y;
    float distance = sqrt(sq(ax) + sq(ay));
    
    if (distance>1) {
      ax = ax / distance;
      ay = ay / distance;
    }
    
    dx += ax;
    dy += ay;
    
    dx *= friction;
    dy *= friction;
    
    x = constrain(x + dx, 0, width);
    y = constrain(y + dy, 0, height);
  }
  
  void draw() {
    ellipse(x,y,20,20);
  }
  
  
}
