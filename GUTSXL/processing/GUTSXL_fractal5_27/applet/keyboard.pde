boolean moveBranch1 = true;

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
  case '\\':
    moveBranch1 = !moveBranch1;
    break;
  case CODED:
    Segment segment = (moveBranch1 ? branch1.getSecondSegment() : branch2.getSecondSegment());
    switch (keyCode) {
      case LEFT:
        segment.rotate(-0.1);
      break;
      case RIGHT:
        segment.rotate(0.1);
      break;
      case UP:
        segment.lengthen(1);
      break;
      case DOWN:
        segment.lengthen(1);
      break;

    default:
      println("KeyCode: <" + keyCode + ">");    
    }
  default:
    println("KeyPressed: <" + key + ">");    
  }  
}

