PImage img, background;
// Declare a variable of type PImage 

void setup() { 
  // Make a new instance of a PImage by loading an image file
  background = loadImage("background.jpg");
  if(background != null)
    background(background);
  img = loadImage("great.jpg");
  frameRate(70);
} 

void draw() { 
  // Draw the image to the screen at coordinate (0,0)
  tint(150, 20);
  if(img != null)
    image(img,50,70); 
}