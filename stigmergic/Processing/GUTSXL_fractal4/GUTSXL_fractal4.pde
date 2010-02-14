int numLevels = 3;
Branch branch1;
Branch branch2;

long numCalls = 0;

void setup() {
  size(1280,1024);
  
  branch1 = new Branch();
  branch2 = new Branch();

  Segment firstSegment = new Segment(width/2, height, width/2, height/2 + height/4);
  branch1.setFirstSegment(firstSegment);
  branch2.setFirstSegment(firstSegment);
}

void draw() {
  background(0);
  stroke(255,255,0);
  
  branch1.makeNewSecondSegment(mouseX, mouseY);
  branch1.calcBranch();

  branch2.makeNewSecondSegment(width - mouseX, mouseY);
  branch2.calcBranch();

  branch1.drawGeneratingSegments();
  branch2.drawGeneratingSegments();
  
  stroke(255);
  numCalls = 0;
  drawTree(branch1, branch2, branch1.getSecondSegment(), numLevels);
  drawTree(branch1, branch2, branch2.getSecondSegment(), numLevels);
  println("Num Calls: " + numCalls);
}

void drawTree(Branch branch1, Branch branch2, Segment lastSegment, int level) {
  numCalls += 1;
  Segment nextSegment1 = branch1.getNextSegment(lastSegment);
  Segment nextSegment2 = branch2.getNextSegment(lastSegment);
  nextSegment1.draw();
  nextSegment2.draw();
  
  if (level > 0) {
    drawTree(branch1, branch2, nextSegment1, level - 1);  
    drawTree(branch1, branch2, nextSegment2, level - 1);  
  }  
}

