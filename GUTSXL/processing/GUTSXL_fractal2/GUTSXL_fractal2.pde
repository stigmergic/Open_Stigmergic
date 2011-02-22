int numLevels = 200;
Branch branch1;

void setup() {
  size(600,600);
  
  Segment firstSegment = new Segment(width/2, height/2 + height/4, width/2, height/2);
  branch1 = new Branch();
  branch1.setFirstSegment(firstSegment);
}

void draw() {
  background(0);
  stroke(255,255,0);
  
  branch1.makeNewSecondSegment(mouseX, mouseY);
  branch1.calcBranch();

  branch1.getFirstSegment().draw();
  branch1.getSecondSegment().draw();
  
  noFill();
  float diameter = branch1.getFirstSegment().getLength() * 2;
  ellipse(width/2, height/2, diameter, diameter);

  stroke(255);
  drawSegments(branch1, branch1.getSecondSegment(), numLevels);
}

void drawSegments(Branch branch1, Segment lastSegment, int level) {
  Segment nextSegment = branch1.getNextSegment(lastSegment);
  nextSegment.draw();

  if (level > 0) drawSegments(branch1,nextSegment, level - 1);  
} 

