boolean run = false;
boolean evap = true;
long total = 0;
long last = millis();

long evapTime = 2 * 60 * 1000;

void setup() {
  size(screen.width, screen.height);
  fill(0,0,100);
  textFont(loadFont("ComicSansMS-Bold-96.vlw"), 96);
}

String formatMillis(long total) {
  long minutes = total / 60000;
  long seconds = (total - minutes * 60000) / 1000;

  return ((minutes < 10) ? "0" : "") +  minutes + ":" + ((seconds < 10) ? "0" : "") + seconds ;
}

void keyPressed() {
  switch(key) {
  case ' ':
    run = !run;
    break;
  case 'r':
    total = 0;
    break;
  case 'e':
    evap = !evap;
    break;
  default:
    println("key_pressed: <" + key + ">");
  }
}

void draw() {
  background(255);

  if (run) {
    total += millis() - last;
  } 

  last = millis();


  String s;
  float off;
   
  s = "GUTS y Girls:  ANTS!!!!";
  off = textWidth(s)/2;
  fill(0,0,255);
  text(s, width/2 - off, 100);
 
  s = "Time: ";
  off = textWidth(s);  

  s += formatMillis(total);

  fill(0,255,0);
  text(s, width/2 - off, height/4);
  if (evap) {
    s = "Evaporation: ";
    off = textWidth(s);  

    if (total - evapTime > 0) {
      s += formatMillis(total - evapTime);
    } else {
      s += "00:00";  
    }
  }

  fill(255,0,0);
  text(s, width/2 - off, height/4*3);


  fill(0,0,100);
  ellipse(width/2, height/2, 110, 110);

  stroke(255,255,0);
  strokeWeight(4);
  float a = (total % 1000)/1000.0*2*PI;
  line(width/2,height/2,width/2 + 50*cos(a),height/2 + 50*sin(a));
}

