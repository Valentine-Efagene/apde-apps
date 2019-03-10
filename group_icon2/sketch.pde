final int ALPHA = 150;
int angle = 0;
int dis = 0;
final int STEP = 45;
final int RADIUS = 50;

void setup(){
  noStroke();
  fullScreen();
}

void draw(){
  pushMatrix();
  translate(width/2, height/2);
  
  if (dis < width * 3){
    rotate(angle);
    fill((int)random(0, 255), (int)random(0, 255), (int)random(0, 255), ALPHA);
    ellipse(0, dis, RADIUS, RADIUS);
    angle += STEP;
    dis += 2;
  }
  
  popMatrix();
}

void mousePressed(){
  background(255);
  dis = 0;
}