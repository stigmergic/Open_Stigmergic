
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
    
    default:
      println("KeyPressed: <" + key + ">");    
  
  }  
}
