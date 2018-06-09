import controlP5.*;

ControlP5 cp5;
PVector origin;
Knob knob, knob2; 
int x, y, resistorValue;
int value1, value2, value3;
int base, multiplier, resistance;
int buttonWidth, buttonHeight;
Bar[] bars = new Bar[3];
color[] colors = new color[8];
Button[] buttons = new Button[4];

void setup(){
  fill(0);
  smooth();
  base = 0;
  multiplier = 0;
  resistance = 0;
  resistorValue = 0;
  value1 = 0; 
  value2 = 0; 
  value3 = 0;
  origin = new PVector(50, 100);
   x = int(origin.x);
  y = int(origin.y);
  colors[0] = #040404;//black
  colors[1] = #4C3030;//brown
  colors[2] = #D81313;//red
  colors[3] = #F86600;//orange
  colors[4] = #F7BE19;//yellow
  colors[5] = #37F00D;//green
  colors[6] = #003DFF;//blue
  colors[7] = #F500FF;//violet
  buttonWidth = 200;
  buttonHeight = 200;
  cp5 = new ControlP5(this);
  buttons[0] = cp5.addButton("band1");
  buttons[0].setValue(0).setPosition(x, y).setSize(buttonWidth, buttonHeight);
  x += buttonWidth;
  buttons[1] = cp5.addButton("band2");
  buttons[1].setValue(0).setPosition(x, y).setSize(buttonWidth, buttonHeight);
  x += buttonWidth;
  buttons[2] = cp5.addButton("band3");
  buttons[2].setValue(0).setPosition(x, y).setSize(buttonWidth, buttonHeight);
  
  for(int i=0; i<3; i++){
    bars[i] = new Bar();
    bars[i].setPosition(origin.x + i * bars[i].width, origin.y + 500);
  }
  
  knob = cp5.addKnob("resVal");
  knob.setValue(50)
    .setPosition(50, 820)
    .setRadius(150)
    .setRange(0, 77);
 
  knob2 = cp5.addKnob("resMult");
  knob2.setValue(50)
    .setPosition(400, 820)
    .setRadius(150)
    .setRange(0, 7)
    .snapToTickMarks(true)
    .setNumberOfTickMarks(7)
    .setTickMarkLength(4);
}

void draw(){
  fill(0);
  background(160);
  resistorValue = int((value1 * 10 + value2) * pow(10, value3));
  resistance = int(base * pow(10, multiplier));
  textSize(50);
  text(resistorValue + " Ohms", origin.x, origin.y + buttonHeight + 100);
  text(resistance + " Ohms", origin.x, 1200);
  
  for(int i=0; i<3; i++){
    bars[i].display();
  }
}

void band1(int value){
  value1++;
  
  if(value1 > 7){
    value1 = 0;
  }
  
  buttons[0].setColorBackground(colors[value1]);
}

void band2(int value){
  value2++;
  
  if(value2 > 7){
    value2 = 0;
  }
  
  buttons[1].setColorBackground(colors[value2]);
}

void band3(int value){
  value3++;
  
  if(value3 > 7){
    value3 = 0;
  }
  
  buttons[2].setColorBackground(colors[value3]);
}

void resVal(int value){
  base = value;
  bars[0].setColor(colors[int(value / 10)]);
  bars[1].setColor(colors[int(value % 10)]);
}

void resMult(int value){
  multiplier = value;
  bars[2].setColor(colors[value]);
}