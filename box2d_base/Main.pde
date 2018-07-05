import org.jbox2d.collision.shapes.*;
import org.jbox2d.pooling.normal.*;
import org.jbox2d.particle.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.callbacks.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.pooling.arrays.*;
import org.jbox2d.common.*;
import org.jbox2d.pooling.stacks.*;
import org.jbox2d.collision.*;
import org.jbox2d.pooling.*;
import org.jbox2d.collision.broadphase.*;
import shiffman.box2d.*;
import org.jbox2d.dynamics.joints.*;

Ball b; 
Ground g;
CustomPolygon cp; 
Vec2[] vertices; 
Box2DProcessing box2d;

void setup(){
  fullScreen();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  
  vertices = new Vec2[4];
  vertices[0] = new Vec2(-15, 25);
  vertices[1] = new Vec2(15, 0); 
  vertices[2] = new Vec2(20, -15); 
  vertices[3] = new Vec2(-10, -10); 
  
  b = new Ball(width/2, height/2, 100);
  g = new Ground(width/2, height/2 + 500, width, 20);
  cp = new CustomPolygon(vertices);
}

void draw(){
  background(255);
  box2d.step();
  g.display();
  b.display();
  cp.display();
}