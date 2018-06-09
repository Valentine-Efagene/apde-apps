void setup(){
  background(0);
  fill(230);
  ellipse(500, 300, 100, 100);
  fill(0);
  ellipse(600, 250, 200, 200);
  fill(255);
  noStroke();
  
  for(int i = 0; i < 700; i++){
    int radius = int(random(6));
    ellipse(random(720), random(1280), radius, radius);
  }
}

void draw(){
  
}