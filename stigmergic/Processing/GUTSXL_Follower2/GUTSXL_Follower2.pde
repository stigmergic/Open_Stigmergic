Follower follower1, follower2;

void setup() {
  size(1280,1000);
  background(0);
  
  follower1 = new Follower();
  follower1.friction = 0.98;
  follower1.c = color(0,0,200);
  
  follower2 = new Follower();
  follower2.friction = 0.99;
  follower2.c = color(255,0,0);
}

void draw() {
  if (mousePressed) background(0);
  follower1.step();
  follower2.step();
  
  follower1.draw();  
  follower2.draw();  
}
