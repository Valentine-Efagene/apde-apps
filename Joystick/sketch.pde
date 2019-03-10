
int x,  y;
final int ALLOWANCE = 150;
final int RADIUS = 100;
PVector pos = new PVector();

void setup(){
  x = width / 2;
  y = height / 2;
  stroke(0);
  fill(0);
  PFont font = createFont("SansSerif", 32);
  textFont(font);
}

void draw(){
  translate(width / 2, height / 2);
  background(255, 255, 255);
  fill(128);
  ellipse(0, 0, RADIUS * 2,  RADIUS * 2);
  fill(0);
  line(0, -height / 2, 0, height / 2);
  line(-width / 2, 0, width/2, 0);
  ellipse(x, y, RADIUS * 2, RADIUS * 2);
  text(x + ", " +  -y,  200, -height/2 + 200);
  
  
  if(!mousePressed){
    x = 0;
    y = 0;
  }
}

void mouseDragged(){
    x = mouseX - width / 2;
    y = mouseY - height / 2;
    
  if(dist(0, 0, x, y) > ALLOWANCE){
    pos.x = x; 
    pos.y = y;
    pos.normalize();
    pos.mult(ALLOWANCE);
    x = (int)pos.x;
    y = (int)pos.y;
  }
}