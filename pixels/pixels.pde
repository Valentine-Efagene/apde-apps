color c;
float rand, rand2,  rand3;

void setup(){
  loadPixels();
  
  for(int i  = 0; i < pixels.length; i++){
    rand = random(255);
    rand2 = random(255);
    rand3 = random(255);
    //c = color(rand);
    c = color(rand, rand2, rand3);
    pixels[i] = c;
  }
  
  updatePixels();
}