final int ALPHA = 150;
int angle = 0;
final int STEP = 45;
final int RADIUS = 300;

void setup(){
  noStroke();
  fullScreen();
}

void draw(){
  pushMatrix();
  translate(width/2, height/2);
  
  if (angle <= 360){
    rotate(angle);
    fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255), ALPHA);
    ellipse(0, 200, RADIUS, RADIUS);
    angle += STEP; 
  }
  
  popMatrix();
}

void mousePressed(){
  background(255);
  angle = 0;
}