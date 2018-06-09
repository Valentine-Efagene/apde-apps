class Bar{
  color c;
  PVector position;
  int width, height;
  
  Bar(){
    c = color(0);
    position = new PVector(50, 200);
    width = 200;
    height = 200;
  }
  
  void display(){
    fill(c);
    rect(position.x, position.y, width, height);
  }
  
  void setPosition(int x, int y){
    position.x = x; 
    position.y = y;
  }
  
  void setPosition(float x, float y){
    position.x = x; 
    position.y = y;
  }
  
  void setColor(color c_){
    c = c_; 
  }
}