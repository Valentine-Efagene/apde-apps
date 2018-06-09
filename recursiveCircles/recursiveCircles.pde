float initialRadius;
int DELAY;
int RADIUSGROWTHRATE;

void setup(){
  initialRadius = 700;
  RADIUSGROWTHRATE = 50;
  DELAY = 80;
  noStroke();
  background(random(255), random(255), random(255));
}

void draw(){
  drawCircle(width/2, height/2, initialRadius);
  initialRadius += RADIUSGROWTHRATE; 
  delay(DELAY);
}

void drawCircle(int x, int y, float radius) { 
  ellipse(x, y, radius, radius); 
  
  if(radius > 2) { 
    radius *= 0.75f; 
    fill(random(255), random(255), random(255));
    drawCircle(x, y, radius); 
    } 
}