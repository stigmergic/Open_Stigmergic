package processing.android.test.gutsxl_follower2;

import processing.android.core.*; 
import processing.android.opengl.*; 
import processing.android.xml.*; 

public class GUTSXL_Follower2 extends PApplet {

Follower follower1, follower2;

public void setup() {
  size(1280,1000);
  background(0);
  
  follower1 = new Follower();
  follower1.friction = 0.98f;
  follower1.c = color(0,0,200);
  
  follower2 = new Follower();
  follower2.friction = 0.99f;
  follower2.c = color(255,0,0);
}

public void draw() {
  if (mousePressed) background(0);
  follower1.step();
  follower2.step();
  
  follower1.draw();  
  follower2.draw();  
}

class Follower {
  float x, y;
  float dx, dy;
  float friction = 0.95f;
  int c;
  float d = 10;

  public void step() {
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
  
  public void draw() {
    noStroke();
    fill(c);
    ellipse(x,y,d,d);
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#ffffff", "GUTSXL_Follower2" });
  }
}
