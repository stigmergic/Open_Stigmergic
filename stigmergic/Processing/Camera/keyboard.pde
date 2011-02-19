
boolean record = false;

public void keyPressed() {
  switch(key) {
    case 'r':
      record = !record;
      break;    
      
     default:
       System.out.println("Key Pressed: <" + key + ">");
       break;
  }
    
}
