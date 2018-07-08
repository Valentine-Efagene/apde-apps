class Ball {
  Body body;
  float x;
  float y;
  float r;

  Ball(float x_,float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1780;
    fd.friction = 0.01;
    fd.restitution = 0.5;//bounciness
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    body = box2d.createBody(bd);
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(0, random(20f, 50f)));
    body.setAngularVelocity(random(10,10));
  }

  void display() {
    fill(0);
    stroke(0);
    float a = body.getAngle();
    ellipseMode(CENTER);
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    ellipse(0,0,r*2,r*2);
    stroke(255);
    line(0,0,r,0);
    popMatrix();
  }
}
