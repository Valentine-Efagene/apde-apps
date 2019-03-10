final float D = 200;
final float W = 75;
int targetID = 0;
float aV = 2 * PI / 13;
float angle = 0;
int i = 0;
float radians = 0;
boolean target = false;
Circle[] c = new Circle[13];
int startTime = 0;
PFont font;
PFont timeFont;

void setup(){
  fullScreen();
  font = createFont("SansSerif", 70);
  timeFont = createFont("SansSerif", 40);
  startTime = second();
  
  for(int i = 0; i < 13; i++){
    c[i] = new Circle( 0,  D, W );
  }
}

void draw(){
  textFont(font);
  text((second() - startTime) % 59, 200, 200);
  
  pushMatrix();
  translate(width/2, height/2);
  
  for(int i = 0; i < 13; i++){
  
  rotate(aV * i);
  
  if(c[i].isClicked()){
    targetID = (i + 7) % 12;
    
    if(c[targetID].isUsed()){
      targetID++;
    }
  }
  
  if (i == targetID ){
    target = true; 
  }else{
    target = false; 
  }
  
  line(0, 0, 0, D);
  c[i].draw(target);
  
  }
  
  popMatrix();
  
  if(countUsed() == 12){
    fill(0);
    textFont(font);
    text("NEXT LEVEL! ", 200, 400);
  }
}

int countUsed(){
  int count = 0;
  
  for(Circle i : c){
    if(i.isUsed()){
      count++;
    }
  }
  
  return count;
}

class Circle{
  float w, x,  y;
  boolean target;
  boolean clicked = false;
  boolean used = false;
  color fillColor;
  color red = color(255, 0, 0);
  color white = color(255, 255, 255);
  color grey = color(128, 128, 128);
  
  Circle( float x,  float y, float w){
    this.w = w;
    this.x = x; 
    this.y = y;
  }
  
  void draw(boolean target){
    this.target = target;
    if (target){
      fillColor = red;
    } else{
      fillColor = white; 
      clicked = false;
    }
    
    if(used){
      fillColor = grey;
    }
    
    fill(fillColor);
    
    ellipse(x, y, w,  w);
    
    if(target && get(mouseX, mouseY) == color(255, 0, 0)){
      this.target = false;
      clicked = true;
      used = true;
      
    }
  }
  
  boolean isClicked(){
    return clicked; 
  }
  
  boolean isUsed(){
    return used;
  }
 
}