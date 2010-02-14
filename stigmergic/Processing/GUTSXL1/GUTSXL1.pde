float firstSegmentLength;

void setup() {
  size(1680,1050);  
  firstSegmentLength = height/4;
}


void draw() {
  if (drawbackground) background(0);

  float alpha =  atan2(mouseY - height/2, mouseX - width/2) + PI/2 ;
  if (alpha > PI) alpha -= 2*PI;
  
  float l = sqrt(sq(mouseY - height/2) + sq(mouseX - width/2));
  float changeInLength = l / firstSegmentLength;
  float ox, oy;

  println (alpha);

  stroke(255,255,0);
  line(width/2, height/2, mouseX, mouseY);
  line(width/2, height/2, width/2, height/2 + firstSegmentLength);
  noFill();
  
  println(alpha);
  if (alpha < 0) {
    arc(width/2, height/2, min(l*2, firstSegmentLength*2), min(l*2, firstSegmentLength*2), PI/2, alpha - PI/2);
  } else {
    arc(width/2, height/2, min(l*2, firstSegmentLength*2), min(l*2, firstSegmentLength*2), alpha - PI/2, PI/2);    
  }
  
  ox = mouseX;
  oy = mouseY;
  stroke(255);

  float oalpha = alpha;

  for (int i=0; i<numlevels; i++) {
    alpha += oalpha;
    l *= changeInLength;
    line(ox, oy, ox + cos(alpha - PI/2) * l, oy + sin(alpha - PI/2) * l);
    ellipse(ox,oy,4,4); 
    ox = ox + cos(alpha - PI/2) * l;
    oy = oy + sin(alpha - PI/2) * l;
  }
  
  //ellipse(ox, oy, 10, 10);
  noLoop();
}

