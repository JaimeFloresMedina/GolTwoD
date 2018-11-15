class Pelota {

  Body body2;      

  float w=20;
  float x, y;
  int q;
  Pelota(float x_, float y_, int q_) {
    x=x_;
    y=y_;
    q=q_;
    BodyDef bodydef = new BodyDef();
    bodydef.type = BodyType.DYNAMIC;
    bodydef.position = box2d.coordPixelsToWorld(x, y);

    body2=box2d.createBody(bodydef);

    CircleShape bola = new CircleShape();
    float radioB2d = box2d.scalarPixelsToWorld(w/2);
    bola.m_radius = radioB2d;

    FixtureDef fixturedef = new FixtureDef();
    fixturedef.shape = bola;
    fixturedef.density = .6;
    fixturedef.friction = 0.3;
    fixturedef.restitution = 0.9;

    body2.createFixture(fixturedef);
    body2.setAngularVelocity(random(-10, 10));
    body2.setUserData(this);
  }

  void eliminaElBody() {

    box2d.destroyBody(body2);
  }

  boolean estaEnPantalla() {

    Vec2 posicion = box2d.getBodyPixelCoord(body2);
    if (posicion.y>height) {
      eliminaElBody();
      paso=true;
     lose++;
      return false;
    } else {
      paso =false;
      return true;
    }
  }

  boolean m() {
    Vec2 pos = box2d.getBodyPixelCoord(body2);
    if (pos.y>height && pos.y<height+200) {
      return true;
    } else
      return false;
  }

  boolean win() {
    Vec2 p = box2d.getBodyPixelCoord(body2);
    if (p.x >=50+z && p.x <=150+z && 
      p.y >= 450 && p.y <= height) {
      l++;
      
      return true;
    } else {
      
      l=0;
      return false;
    }
  }

  int Pt() {
    if (q==0) {
      return 1;
    } else {
      return 2;
    }
  }

  void display() {

    Vec2 pos = box2d.getBodyPixelCoord(body2);    
    float a = body2.getAngle();


    switch(this.q) {
    case 0:
      pushMatrix();
      translate(pos.x, pos.y);    
      rotate(-a);              
      fill(255, 0, 0);
      noStroke();
      imageMode(CENTER);
      image(ball, 0, 0);
      popMatrix();
      break;
    case 1:
      pushMatrix();
      translate(pos.x, pos.y);    
      rotate(-a);              
      fill(255, 0, 0);
      noStroke();
      imageMode(CENTER);
      image(ball1, 0, 0);
      popMatrix();
      break;
    }
  }
}
