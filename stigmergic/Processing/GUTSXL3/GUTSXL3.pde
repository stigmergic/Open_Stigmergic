float firstSegmentLength;
int numLevels = 200;

void setup() {
  size(1024,750);  
  firstSegmentLength = height/4;
}

void draw() {
  background(0);

  float angle =  atan2(mouseY - height/2, mouseX - width/2);

  float l = sqrt(sq(mouseY - height/2) + sq(mouseX - width/2));
  float changeInLength = l / firstSegmentLength;

  stroke(255,255,0);
  noFill();
  drawSeedSegments(angle);

  stroke(255);
  drawSegments(mouseX, mouseY, angle, l, angle + PI/2, changeInLength, numLevels);

  noLoop();
}

void mouseMoved() {
  loop();  
}

void drawSeedSegments(float angle) {
  line(width/2, height/2, mouseX, mouseY);
  line(width/2, height/2, width/2, height/2 + firstSegmentLength);
  ellipse(width/2, height/2, firstSegmentLength*2, firstSegmentLength*2);
}

void drawSegments(float x, float y, float angle, float l, float changeInAngle, float changeInLength, float level) {  
  angle += changeInAngle;
  l *= changeInLength;
  float nx = x + cos(angle) * l;
  float ny = y + sin(angle) * l;

  line(x, y, nx, ny);
  ellipse(x, y, 4, 4);

  if (level > 0) drawSegments(nx,ny,angle,l,changeInAngle,changeInLength,level - 1);  
}

