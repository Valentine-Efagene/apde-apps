void setup() {
  ellipseMode(CENTER);
  background(20, 25, 40);
}

void draw() { 
  pushMatrix();
  translate(width / 2, height / 2);
  drawWhiteOfEye();
  drawPupil();
  for(int i = -50; i <= 50; i++) {
    fill(200, 30, 58);
    rotate(i * 5);
    triangle(-200, 100, 200, 100, 0, 200);
  }
  popMatrix();
} 
 
void drawPupil() { 
  fill(0, 0, 0);
  ellipse(0, 0, 50, 50);
  fill(200, 200, 200);
  ellipse(10, -10, 10, 10);
}

void drawWhiteOfEye(){
  fill(230, 230, 230);
  ellipse(0, 0, 300, 300);
}