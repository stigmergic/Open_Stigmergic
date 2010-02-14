
float x1, y1, x2, y2;


void setup() {
  size(screen.width/2, screen.height/2);

  x1 = random(width);
  y1 = random(height);
  x2 = random(width);
  y2 = random(height); 
}

void draw() {
  background(0);
  stroke(255,0,0);
  line(x1, y1, x2, y2);

  noStroke();
  fill(0,255,0,100);
  ellipse(mouseX, mouseY, 8, 8);

  stroke(255,255,0,200);
  line(mouseX, mouseY, x1, y1);
  line(mouseX, mouseY, x2, y2);

}

