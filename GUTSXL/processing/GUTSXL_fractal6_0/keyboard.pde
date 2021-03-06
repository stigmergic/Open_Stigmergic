boolean moveBranch1 = true;
boolean blur = false;
boolean limitCalcs = false;
boolean drawgrayscale = true;
boolean drawgeneratorsmap = true;
boolean shouldloop = false;

void keyPressed() {
  switch (key) {
  case '<':
    numLevels = max(0, numLevels-1);
    println("Number of levels: " + numLevels);
    break;
  case '>':
    numLevels = numLevels+1;
    println("Number of levels: " + numLevels);
    break;
  case 'b':
    blur = !blur;
    if (blur) background(drawgrayscale ? 255 : 0);
    break;
  case 'c':
    limitCalcs = !limitCalcs;
    break;
  case 'l':
    shouldloop = !shouldloop;
    break;
  case 'g':
    drawgrayscale = !drawgrayscale;
    break;
  case 'm':
    drawgeneratorsmap = !drawgeneratorsmap;
    break;
  case '\\':
    moveBranch1 = !moveBranch1;
    break;
  case CODED:
    Branch branch = moveBranch1 ? branch1 : branch2;
    Segment segment = branch.getSecondSegment();
    switch (keyCode) {
      case LEFT:
        segment.rotate(-0.01);
        branch.calcBranch();  
      break;
      case RIGHT:
        segment.rotate(0.01);
        branch.calcBranch();  
      break;
      case UP:
        segment.lengthen(1);
        branch.calcBranch();  
      break;
      case DOWN:
        segment.lengthen(-1);
        branch.calcBranch();  
      break;

    default:
      println("KeyCode: <" + keyCode + ">");    
    }
  default:
    println("KeyPressed: <" + key + ">");    
  }  
  loop();
}

