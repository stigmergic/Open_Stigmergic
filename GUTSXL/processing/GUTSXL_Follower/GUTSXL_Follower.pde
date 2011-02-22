Follower follower;

void setup() {
  size(500,500);
  background(100);
  follower = new Follower();
}

void draw() {
  if (mousePressed) background(100);
  follower.step();
  
  fill(255);
  follower.draw();  
}
