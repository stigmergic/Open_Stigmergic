import java.util.Collections;

ArrayList flist = null;
//String dirName = "/Users/joshua/Desktop/DawnsPhone/images";
//String dirName = "/Users/joshua/svn/stigmergic.net/stigmergic_web/sv/galleries/gal1/images";
String dirName = "/Users/joshua/work/Processing/StigmergicProcessing/Camera/time_lapse";

ArrayList imgList = new ArrayList();

void setup() {
  //size(640,480);
  size(screen.width, screen.height);
  File dir = new File(dirName);

  String[] children = dir.list();
  
  if (dirName.endsWith("list")) {
    children = loadStrings(dirName);
    dirName = "";  
  }
  
  ArrayList list = new ArrayList();
  if (children == null) {
    // Either dir does not exist or is not a directory
    println("Dir:" + dir + " does not exist.");
  } 
  else {
    for (int i=0; i<children.length; i++) {
      // Get filename of file or directory
      String filename = children[i];
      if (filename.endsWith(".jpg")) {
        list.add(filename);
      }
    }
    Collections.sort(list);
    flist = list;
  }

}

int i=0;
boolean uselist = false;

void draw() {
  if (i>=flist.size()) i=0;
  String fname;
  fname = (String)flist.get(i);
  println(fname);

  if (uselist) {
    if (imgList.size()<flist.size()) {
      imgList.add(loadImage(dirName+'/'+fname));
    }
  
    imageMode(BLEND);
    image((PImage) imgList.get(i),0,0,width,height);
  } else {
    image(loadImage( dirName+'/'+fname ), 0,0,width,height); 
  }

  //noLoop();
  //if (i>=flist.size()) noLoop();
  i++;
}

void keyPressed() {
  loop(); 
}

