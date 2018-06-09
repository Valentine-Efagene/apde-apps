int[] value = {50, 20, 150};
int[] pos = {20, 20};

void setup() {
}

void draw() { 
  fill(value[0], value[1], value[2]); 
  ellipse(pos[0], pos[1], 50, 50); 
} 
 
void mouseDragged() { 
  for(int i = 0; i < 3; i++) {
    value[i] += 5;
    if(value[i] > 255){
      value[i] = 0;
    }
  }
  
  pos[0] = mouseX; 
  pos[1] = mouseY; 
}