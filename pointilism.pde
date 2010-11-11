PImage img;

int smallPoint = 2;
int largePoint;
int top, left;

int points = 100;
int pointsize = 100; //0 to 100
String imagepath = "kayaking.jpg";

void setup() {
  noLoop();
  img = loadImage(imagepath);
  size(img.width, img.height);
  noStroke();
  background(255);
  smooth();
  largePoint = min(width, height) / 10;
  // center the image on the screen
  left = (width - img.width) / 2;
  top = (height - img.height) / 2;
}

void draw() {
  splat();
}

void splat() {
   for (int i=0; i<points; i++) {
    float pointillize = map(pointsize, 0, 100, smallPoint, largePoint);
    int x = int(random(img.width));
    int y = int(random(img.height));
    color pix = img.get(x, y);
    fill(pix, 128);
    ellipse(left + x, top + y, pointillize, pointillize);
  } 
}

void keyPressed() {
  //draw more dots of different sizes
  if ( key >= '1' && key <= '9') {
    println(key);
    pointsize = ((int) key-48) * 10;
    println(pointsize);
    redraw();
  } else if (keyCode == ENTER) {
    println();
    println("Rendering image...");
    String fileName = "images/pointilism-" + dateString() + ".png";
    save(fileName);
    println("Rendered image to: " + fileName);
  }

  // hack for un-responsive non looping p5 sketches
  if (keyCode == ESC) {
    redraw();
  }
}

String dateString() {
  return year() + "-" + nf(month(), 2) + "-" + nf(day(), 2) + "@" +
    nf(hour(), 2) + "-" + nf(minute(), 2) + "-" + nf(second(), 2);
}
