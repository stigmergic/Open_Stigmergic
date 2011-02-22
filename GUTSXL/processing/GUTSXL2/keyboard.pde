boolean drawbackground = true;

void keyPressed() {
  switch (key) {
    case 'b':
      drawbackground = !drawbackground;
      break;
      
    default:
      println("Key Pressed: <" + key + ">"); 
  }  
}

void mouseMoved() {
  loop();
}
