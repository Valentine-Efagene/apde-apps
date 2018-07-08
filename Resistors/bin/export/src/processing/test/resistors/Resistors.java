package processing.test.resistors;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Resistors extends PApplet {



ControlP5 cp5;
int value1, value2, value3,  value4;
int x, y;
PVector origin;
int buttonWidth, buttonHeight;
Button[] buttons = new Button[4];
int[] colors = new int[9];
float resistorValue;

public void setup(){
  textSize(32);
  origin = new PVector(50, 200);
  resistorValue = 0;
  colors[0] = 0xff040404;//black
  colors[1] = 0xff4C3030;//brown
  colors[2] = 0xffD81313;//red
  colors[3] = 0xffF86600;//orange
  colors[4] = 0xffF7BE19;//yellow
  colors[5] = 0xff37F00D;//green
  colors[6] = 0xff003DFF;//blue
  colors[7] = 0xffF500FF;//violet
  fill(0);
  x = PApplet.parseInt(origin.x);
  y = PApplet.parseInt(origin.y);
  buttonWidth = 200;
  buttonHeight = 200;
  value1 = 0;
  value2 = 0;
  value3 = 0;
  value4 = 0;
  cp5 = new ControlP5(this);
  buttons[0] = cp5.addButton("band1");
  buttons[0].setValue(0).setPosition(x, y).setSize(buttonWidth, buttonHeight);
  x += buttonWidth;
  buttons[1] = cp5.addButton("band2");
  buttons[1].setValue(0).setPosition(x, y).setSize(buttonWidth, buttonHeight);
  x += buttonWidth;
  buttons[2] = cp5.addButton("band3");
  buttons[2].setValue(0).setPosition(x, y).setSize(buttonWidth, buttonHeight);
  //x += buttonWidth;
  //buttons[3] = cp5.addButton("band4");
  //buttons[3].setValue(0).setPosition(x, y).setSize(buttonWidth, buttonHeight);
}

public void draw(){
  background(255);
  resistorValue = (value1 * 10 + value2) * pow(10, value3);
  text(PApplet.parseInt(resistorValue) + " Ohms", origin.x, origin.y + buttonHeight + 100);
}

public void band1(int value){
  value1++;
  
  if(value1 > 7){
    value1 = 0;
  }
  
  buttons[0].setColorBackground(colors[value1]);
}

public void band2(int value){
  value2++;
  
  if(value2 > 7){
    value2 = 0;
  }
  
  buttons[1].setColorBackground(colors[value2]);
}

public void band3(int value){
  value3++;
  
  if(value3 > 7){
    value3 = 0;
  }
  
  buttons[2].setColorBackground(colors[value3]);
}
/*
void band4(int value){
  value4++;
  
  if(value4 > 7){
    value4 = 0;
  }
  
  buttons[3].setColorBackground(colors[value4]);
}*/
  public void settings() { fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Resistors" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
