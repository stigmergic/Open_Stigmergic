import processing.video.*;

String cameraName = "Sony HD Eye for PS3 (SLEH 00201)";
//String cameraName = null;

int framesPerSave = 30;

String dirName = "time_lapse";

Capture myCapture;

long ticks = 0;

void setup() 
{
  size(screen.width, screen.height);
   println(Capture.list()); 

   
   if (cameraName == null) {
      myCapture = new Capture(this, width/2, height/2, 30);
   } else {
     try {
      myCapture = new Capture(this, width/2, height/2, cameraName, 30);
   } catch (Exception e) {
      myCapture = new Capture(this, width/2, height/2, 30);     
   }
   }
   
}

void draw() {
  image(myCapture, 0, 0,width,height);
  
  if (record && ticks % framesPerSave == 0) {
    new Thread(new Runnable() {
      public void run() {
        saveFrame(dirName + "/" + System.currentTimeMillis() + "-####.jpg");
      }
    }).start();
  }  

  ticks ++;
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}
