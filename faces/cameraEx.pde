import com.onlylemi.processing.android.capture.*;

AndroidCamera ac;
PImage img;

void setup() {
  //size(720, 1280);
  background(0);
  ac = new AndroidCamera(720, 1280, 30);
  ac.start();
  println(width);
  println(height);
}

void draw() {
  // get android camera frame
  img = ac.getCameraImage();
  image(img, 0, 0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(200, 200, 100, 100);
}