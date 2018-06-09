PImage img, background;
// Declare a variable of type PImage 

void setup() { 
  save("result.jpg");
  // Make a new instance of a PImage by loading an image file
  background = loadImage("background.jpg");
  if(background != null)
    background(background);
  img = loadImage("great.jpg"); 
  tint(150, 100);
  if(img != null)
    image(img,50,70);
} 