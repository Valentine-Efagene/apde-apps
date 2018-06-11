import controlP5.*;

class Body{
  private float a, v, x, y, ke,  kv;
  float m, radius, c;
  float appliedForce, viscousForce, massForce, elsticForce;
  
  Body(float argMass){
    c = 0;
    m = argMass;
    radius = m;
    kv = 25;
    ke = 30;
    a = 0;
    x = 0;
    y = -300;
    v = 0;
  }
  
  void update(){
    a = (appliedForce -  kv * v - ke * x)/m; 
    v += a;
    x += v;
  }
  
  void display(){
    ellipseMode(RADIUS);
    ellipse(x, y, radius, radius);
  }
  
  void applyForce(float argF){
    appliedForce = argF;
  }
  
  void setKe(float c){
    ke = c;
  }
  
  void setKv(float c){
    kv = c;
  }
  
  float getX(){
    return x; 
  }
  
 void setY(float value){
    y = value;
  }
}