Mover[] mover;
float windMagnitude;

void setup() {
  fullScreen();
  windMagnitude = 200;
  mover = new Mover[5];
  
  for(int i  = 0; i < 5; i++){
    mover[i] = new Mover(random(16, 100));
    mover[i].setC(0.3);
  }
}

void draw(){
  background(0);
  
  for(int i = 0; i < 5; i++){
    mover[i].update();
    mover[i].display();
    mover[i].checkEdges();
  }
}

void mousePressed(){
  for(int i = 0; i < 5; i++){
    PVector wind = new PVector(mouseX, mouseY);
    wind.sub(mover[i].position);
    wind.normalize();
    wind.mult(windMagnitude);
    mover[i].applyForce(wind);
  }
}