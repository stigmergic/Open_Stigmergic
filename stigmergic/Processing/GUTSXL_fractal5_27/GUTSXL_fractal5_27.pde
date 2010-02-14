float firstSegmentLength;
int numLevels = 0;

long numCalls = 0;

Branch branch1;
Branch branch2;

void setup() {
  //size(600,600);
  //size(1680,1050);
  size(screen.width, screen.height);
  background(0);

  Segment firstSegment = new Segment(width/2, height, width/2, height - height/4);
  firstSegmentLength = firstSegment.getLength();
  branch1 = new Branch();
  branch1.setFirstSegment(firstSegment);
  branch1.makeNewSecondSegment(width/2 + height/16, height/2 + height/8);
  branch2 = new Branch();
  branch2.setFirstSegment(firstSegment);
  branch2.makeNewSecondSegment(width/2 - height/16, height/2 + height/8);
}

void draw() {
  if (!blur) background(0);

  branch1.calcBranch();

  branch2.calcBranch();

  Branch branch = moveBranch1 ? branch1 : branch2;
  branch.drawGeneratingSegments(color(255,0,0));
  branch = (branch == branch1) ? branch2 : branch1;
  branch.drawGeneratingSegments(color(0,0,255));

  numCalls = 0;

  noFill();
  //ellipse(width/2, height-height/4, firstSegmentLength*2, firstSegmentLength*2);
  stroke(255);
  if (random(1.0) < 0.5) { 
    drawTree(branch1, branch2, branch1.getSecondSegment(), numLevels);
    drawTree(branch1, branch2, branch2.getSecondSegment(), numLevels);
  } 
  else {
    drawTree(branch1, branch2, branch2.getSecondSegment(), numLevels);
    drawTree(branch1, branch2, branch1.getSecondSegment(), numLevels);
  }
  //drawSegments(branch2, branch2.getSecondSegment(), numLevels);

  println("Num Calls: " + numCalls);
}

void drawSegments(Branch branch1, Segment lastSegment, int level) {
  numCalls += 1;
  Segment nextSegment = branch1.getNextSegment(lastSegment);
  nextSegment.draw();

  if (nextSegment.getLength()<1) return;
  if (level > 0) drawSegments(branch1, nextSegment, level - 1);  
} 

void drawTree(Branch branch1, Branch branch2, Segment lastSegment, int level) {
  numCalls += 1;
  if (limitCalcs && numCalls>10000) return;
  Segment nextSegment;

  float limit = 2.0;

  if (random(1.0) < 0.5) { 
    nextSegment = branch1.getNextSegment(lastSegment);
    nextSegment.draw();
    if (nextSegment.getLength() > limit && level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  

    nextSegment = branch2.getNextSegment(lastSegment);
    nextSegment.draw();
    if (nextSegment.getLength() > limit && level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  
  } 
  else {
    nextSegment = branch2.getNextSegment(lastSegment);
    nextSegment.draw();
    if (nextSegment.getLength() > limit && level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  

    nextSegment = branch1.getNextSegment(lastSegment);
    nextSegment.draw();
    if (nextSegment.getLength() > limit && level > 0) drawTree(branch1, branch2, nextSegment, level - 1);  

  }
  //What do we need to do here?
}

