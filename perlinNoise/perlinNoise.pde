float t = 3;
PVector pos;

void setup(){
  pos = new PVector();
  fullScreen();
  pos.y = 0;
  pos.x = 0;
}

void draw(){
  float n = noise(t);
  pos.x = map(n, 0, 1, 0, width);
  ellipse(pos.x, pos.y, 16, 16);
  t += 0.01;
  pos.y += 2;
}