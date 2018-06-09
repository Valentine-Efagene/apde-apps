float x,y,z; 
void setup() { 
  size(720,1200,P3D); 
  background(36, 120, 140);
  fill(51);
  stroke(255);
  x = width/2; 
  y = height/2; 
  z = 0; 
  } 
  
  void draw() { 
    translate(x,y,z); 
   rotateX(PI / 8);
   rotateY(PI / 4);
   rotateZ(PI / 8);
    rectMode(CENTER); 
    rect(0,0,100,100); 
    z++; 
    // The rectangle moves forward as z increments. 
    }