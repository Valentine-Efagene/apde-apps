Walker walker; 

void setup(){
  walker = new Walker();
}

void draw(){
  walker.display();
  walker.step();
}