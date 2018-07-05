class CustomPolygon {
  Body body;
  Vec2[] vertices;
  float x; 
  float y; 
  
  CustomPolygon (Vec2[] v) {
    x = 200;
    y = 200;
    vertices = v; 
    vertices[0] = box2d.vectorPixelsToWorld(v[0]);
    vertices[1] = box2d.vectorPixelsToWorld(v[1]); 
    vertices[2] = box2d.vectorPixelsToWorld(v[2]); 
    vertices[3] = box2d.vectorPixelsToWorld(v[3]); 
    
    PolygonShape ps = new PolygonShape(); 
    ps.set(vertices, vertices.length);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 10;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    body = box2d.createBody(bd);
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(0, random(5f, 10f)));
    body.setAngularVelocity(random(-10,10));
  }

  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body); 
    float a = body.getAngle(); 
    Fixture f = body.getFixtureList(); 
    PolygonShape ps = (PolygonShape) f.getShape(); 
    rectMode(CENTER); 
    pushMatrix(); 
    translate(pos.x,pos.y); 
    rotate(-a); 
    fill(175); 
    stroke(0); 
    beginShape(); 
    
    for (int i = 0; i < ps.getVertexCount(); i++) { 
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i)); 
      vertex(v.x,v.y); 
    } 
      
     endShape(CLOSE); 
     popMatrix(); 
  }
}
