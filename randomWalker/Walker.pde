class Walker{
  int x, y;
  
  Walker(){
    x = width/2; 
    y = height/2;
  }
  
  void display(){
    point(x, y);
  }
  
  void step(){
    int choice = int(random(4));
    
    switch(choice){
      case 0:
        x++;
        break;
      case 1:
        x--;
        break;
      case 2:
        y++;
        break;
      case 3:
        y--;
        break;
      default:
        break;
    }
  }
}