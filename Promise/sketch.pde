import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.support.v4.app.*;
import android.view.View.OnKeyListener;
import android.view.KeyEvent;
import android.view.View; 

Table table;
public String[] user = {""};
Additional ad;
boolean writePermitted = false; 
float[] D = {100, 200, 300};
float[] W = {50, 75, 100};
float d,  w;
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
int config = 1;

void setup(){
  fullScreen();
  ad = new Additional(user);
  runOnUiThread(ad);
  requestPermission("android.permission.READ_EXTERNAL_STORAGE", "handlePermission");
  table = new Table(); 
  table.addColumn("id"); 
  table.addColumn("species"); 
  table.addColumn("name"); 
  TableRow newRow = table.addRow(); 
  newRow.setInt("id", table.lastRowIndex()); 
  newRow.setString("species", "Panthera leo"); 
  newRow.setString("name", "Lion"); 
  d = D[0];
  w = W[0];
  font = createFont("SansSerif", 70);
  timeFont = createFont("SansSerif", 40);
  startTime = second();
  
  for(int i = 0; i < 13; i++){
    c[i] = new Circle( 0.0,  d, w );
  }
}

void handlePermission(boolean granted) { 
  if (granted) {
      writePermitted = true;
  }else{
    println("File not created!");
  }
}

void draw(){
  if(user[0] == ""){
    return;
  }
  
  //textFont(font);
  //text((second() - startTime) % 59, 200, 200);
  textFont(font);
  
  if(config == 10){
    background(200);
    fill(0);
    text("The End!", 200, 200);
    return;
  }else{
    fill(0);
    text(config, 200, 200);
  }
  
  pushMatrix();
  translate(width/2, height/2);
  
  if(i >= 13){
    i = 0;
  }
  
  rotate(aV * i);
  
  if(c[i].isClicked()){
    targetID = (i + 7) % 13;
    
    while(c[targetID].isUsed()){
      targetID = (targetID + 1) % 13;
    }
  }
  
  if (i == targetID ){
    target = true; 
  }else{
    target = false; 
  }
  
  line(0, 0, 0, d);
  c[i].draw(target);
  
  i++;
  
  popMatrix();
  
  if(countUsed() == 13){
    //fill(0);
    //textFont(font);
    //text("NEXT LEVEL! ", 200, 400);
    config++;
    
    if(config < 10){
      if(writePermitted){
        saveTable(table, "/storage/emulated/0/Sketchbook/file/" + user[0] + ".csv"); 
      }
      reset();
    }
    
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

void reset(){
  switch(config){
    case 2:
      background(200);
      w = W[0];
      d = D[1];
      for(int i = 0; i < 13; i++){
        c[i] = new Circle( 0.0,  d, w );
      }
      break;
      
      case 3:
      background(200);
      w = W[0];
      d = D[2];
      for(int i = 0; i < 13; i++){
        c[i] = new Circle( 0.0,  d, w );
      }
      break;
      
      case 4:
      background(200);
      w = W[1];
      d = D[0];
      for(int i = 0; i < 13; i++){
        c[i] = new Circle( 0.0,  d, w );
      }
      break;
      
      case 5:
      background(200);
      w = W[1];
      d = D[1];
      for(int i = 0; i < 13; i++){
        c[i] = new Circle( 0.0,  d, w );
      }
      break;
      
      case 6:
      background(200);
      w = W[1];
      d = D[2];
      for(int i = 0; i < 13; i++){
        c[i] = new Circle( 0.0,  d, w );
      }
      break;
      
      case 7:
      background(200);
      w = W[2];
      d = D[0];
      for(int i = 0; i < 13; i++){
        c[i] = new Circle( 0.0,  d, w );
      }
      break;
      
      case 8:
      background(200);
      w = W[2];
      d = D[1];
      for(int i = 0; i < 13; i++){
        c[i] = new Circle( 0.0,  d, w );
      }
      break;
      
      case 9:
      background(200);
      w = W[2];
      d = D[2];
      for(int i = 0; i < 13; i++){
        c[i] = new Circle( 0.0,  d, w );
      }
      break;
    default:
      break; 
  }
  
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

class Additional implements Runnable, OnKeyListener{
  String[] s;
  EditText et;
  
  Additional(String[] s){
    this.s = s;
  }
  
  public boolean onKey(View v, int keyCode, KeyEvent event) { 
     if ((event.getAction() == KeyEvent.ACTION_DOWN) && (keyCode == KeyEvent.KEYCODE_ENTER)) { 
        s[0] = et.getText().toString();
        et.setVisibility(View.INVISIBLE);
        return true;
     }
          
     return false; 
  } 
  
  public void run() { 
      FrameLayout fl = new FrameLayout(getContext());
      et = new EditText(getContext());
      et.setBackgroundColor(color(255));
      
      FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(500, 100);
      lp.topMargin = 10;
      lp.leftMargin = 10;
      View surfaceView = getSurface().getSurfaceView();
      ViewGroup parent=(ViewGroup)surfaceView.getParent();
      parent.removeView(surfaceView);
      parent.addView(fl);
      fl.addView(surfaceView);
      fl.addView(et,lp);
      et.setOnKeyListener(this);
    }
}