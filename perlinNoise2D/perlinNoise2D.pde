float tx = 3, ty = 20;
PVector pos;

void setup(){
  pos = new PVector();
  fullScreen();
}

void draw(){
  float n = noise(tx);
  float m = noise(ty);
  pos.x = map(n, 0, 1, 0, width);
  pos.y = map(m, 0, 1, 0, height);
  ellipse(pos.x, pos.y, 16, 16);
  tx += 0.01;
  ty += 0.01;
}