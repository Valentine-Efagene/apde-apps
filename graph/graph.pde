PVector start, end;

void setup(){
  start = new PVector(-width/2, -height/2);
  end = new PVector(300, 0);
  end.rotate(radians(-60));
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}

void draw(){
  pushMatrix();
  translate(width/2, height/2);
  line(start.x, start.y, end.x, end.y);
  popMatrix();
}