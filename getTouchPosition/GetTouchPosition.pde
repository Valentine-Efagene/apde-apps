String s;
int x = 0;
int y = 0;

void setup() {
  background(30, 25, 65);
  textSize(32);
}

void draw(){
    pushMatrix();
    translate(width / 2, height / 2);
    if(s != null)
      text(s, 0, 0);
    line(-width / 2,  0, width / 2, 0);
    line(0, -height / 2, 0, height / 2);
    popMatrix();
}

void mousePressed(){
  x = mouseX - width / 2;
  y = -1 * (mouseY - height / 2);
  s = x + ", " + y;
}

void mouseReleased(){
  background(30, 25, 65);
}