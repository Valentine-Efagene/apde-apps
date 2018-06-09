class Mover{
  PVector force, acceleration, velocity,  position;
  float mass, radius, c;
  
  Mover(float argMass){
    c = 0;
    mass = argMass;
    radius = mass; 
    acceleration = new PVector(0, 0);
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
  }
  
  void update(){
    PVector drag = velocity.get();
    drag.normalize();
    drag.mult(-1);
    drag.mult(velocity.mag() * velocity.mag() * c);
    applyForce(drag);
    velocity.add(acceleration);
    velocity.limit(4);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    ellipseMode(RADIUS);
    ellipse(position.x, position.y, radius, radius);
  }
  
  void applyForce(PVector argF){
    PVector f = argF.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void checkEdges() { 
    if (position.x + radius > width) { 
      position.x = width - radius; 
      velocity.x *= -1; 
      } else if (position.x - radius< 0) { 
        velocity.x *= -1; 
        position.x = radius; 
      } 
        
      if (position.y + radius> height) { 
          velocity.y *= -1; 
          position.y = height - radius;
      }else if(position.y - radius < 0){
          velocity.y *= -1;
          position.y = radius;
        }
     }
     
  void checkCollision(Mover argM){
    //Mover m = argM; 
    //to be completed
  }
  
  void setC(float c_){
    c = c_;
  }
}