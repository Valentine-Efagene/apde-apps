float initialRadius;
int radiusLimit;

void setup() { 
  initialRadius = 350;
  radiusLimit = 20;
} 

void draw() { 
  drawCircle(width/2,height/2, initialRadius); 
} 
  
void drawCircle(float x, float y, float radius) { 
  noFill(); 
  ellipse(x, y, radius, radius); 
  
  if(radius > radiusLimit) { 
    drawCircle(x + radius/2, y, radius/2); 
    drawCircle(x -radius/2, y, radius/2); 
    drawCircle(x, y + radius/2, radius/2); 
    drawCircle(x, y -radius/2, radius/2);
    } 
}

void mousePressed(){
  if(mouseY > height / 2)
    stroke(random(255), random(255), random(255));
  else
    background(random(255), random(255), random(255));
}