
class Circulo {

  Body body1;      
  float w=60;

  Circulo() {



    BodyDef bodydef = new BodyDef();
    bodydef.type = BodyType.KINEMATIC;
    bodydef.position = box2d.coordPixelsToWorld(x, y);

    body1=box2d.createBody(bodydef);

    CircleShape bola = new CircleShape();
    float radioB2d = box2d.scalarPixelsToWorld(w/2);
    bola.m_radius = radioB2d;

    FixtureDef fixturedef = new FixtureDef();
    fixturedef.shape = bola;
    fixturedef.density =.9;
    fixturedef.friction =.9;
    fixturedef.restitution =.9;

    body1.createFixture(fixturedef);

    body1.setUserData(this);
  }

  void mov(float x, float y) {
    body1.setTransform(box2d.coordPixelsToWorld(x, height/2), 0);
  }

  void display() {

    Vec2 pos = box2d.getBodyPixelCoord(body1);    
    float a = body1.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);    
    rotate(-a);             
    fill(#188EAD);
    noStroke();
    imageMode(CENTER);
    image(cara, 0, 0);
    popMatrix();
  }
}
