PVector start, end;

void setup(){
  background(0);
  start = new PVector(0, 0);
  end = new PVector(0, 720);
}

void draw(){
  line(start.x, start.y, end.x, end.y);
}

void mouseDragged(){
  stroke(random(255), random(255), random(255));
  end.x = mouseX;
  end.y = mouseY;
}