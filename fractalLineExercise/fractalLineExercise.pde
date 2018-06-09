int initialLength;
boolean baseLineVertical;

void setup(){
  fullScreen();
  initialLength = 1000;
  baseLineVertical = true;
}

void draw(){
  cantor(width/2, height/2, initialLength, baseLineVertical);
}

void cantor(float x, float y, float len, boolean vert) { 
  if(len<1) 
    return;
  
  if(vert == false){
    line(x, y,  x + len/2, y);
    line(x, y,  x - len/2, y); 
    vert = !vert;
    cantor(x + len/2, y,  len/2, vert);
    cantor(x - len/2, y,  len/2, vert);
  }else{
    line(x, y, x, y + len/2);
    line(x, y,  x, y - len/2); 
    vert = !vert;
    cantor(x, y + len/2,  len/2, vert);
    cantor(x, y - len/2,  len/2, vert);
  }
}

void mousePressed(){
  if(mouseY > height / 2)
    stroke(random(255), random(255), random(255));
  else
    background(random(255), random(255), random(255));
}