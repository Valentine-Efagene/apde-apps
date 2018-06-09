int spacing; 

void setup(){
  fullScreen();
  spacing = 20;
}

void draw(){
  cantor(10, 20, width-20);
}

void cantor(float x, float y, float len) { 
  if(len<1) 
    return;
  
  line(x,y,x+len,y); 
  y += spacing; 
  cantor(x,y,len/3);
  cantor(x+len*2/3,y,len/3);
}