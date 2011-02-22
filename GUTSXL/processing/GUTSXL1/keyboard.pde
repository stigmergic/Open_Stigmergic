boolean drawbackground = true;
int numlevels = 100;

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
