float firstSegmentLength;
int numLevels = 200;

void setup() {
  size(1680,1050);  
  firstSegmentLength = height/4;
}


void draw() {
  if (drawbackground) background(0);

  float angle =  atan2(mouseY - height/2, mouseX - width/2);
  if (angle > PI) angle -= 2*PI;

  float l = sqrt(sq(mouseY - height/2) + sq(mouseX - width/2));
  float changeInLength = l / firstSegmentLength;

  stroke(255,255,0);
  noFill();
  drawSeedSegments(angle);

  stroke(255);
  drawSegments(mouseX, mouseY, angle, l, angle + PI/2, changeInLength, numLevels);
  
  noLoop();
}

void drawSeedSegments(float angle) {
  line(width/2, height/2, mouseX, mouseY);
  line(width/2, height/2, width/2, height/2 + firstSegmentLength);
  ellipse(width/2, height/2, firstSegmentLength*2, firstSegmentLength*2);
  drawAngle(width/2, height/2, 20, angle);
}

void drawAngle(float x, float y, float r, float angle) {
  if (angle + PI/2 < 0) {
    arc(x, y, 2*r, 2*r, PI/2, angle);
  } 
  else {
    arc(x, y, 2*r, 2*r, angle, PI/2);    
  }  
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


