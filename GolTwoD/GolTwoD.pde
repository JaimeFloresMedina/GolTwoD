
import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Capture video;
OpenCV opencv;
Circulo cabeza;
PImage ball, bq, ball1, st, st1, st2, st3, cara, r1, r2, r3, r4, r5;
Barra B, B1;
Canasta C1, C2;
Pantallas p;
boolean paso=true, doble=false, rcd=false;
int record[]=new int[50];
int Rc, Rc1, Rc2, yu=0;

ArrayList<Pelota> pelotas;
ArrayList<Canasta> canasta;
float x, y;
int z=0, e=10, l=0, m=0, my=0;
int contador, q, lose=0;
int Pantalla=0;

void setup() {
  size(640, 480);
  smooth();
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();

  box2d = new Box2DProcessing(this);  
  box2d.createWorld();
  box2d.setGravity(0, -1000);
  pelotas = new ArrayList<Pelota>();
  canasta = new ArrayList<Canasta>();
  p=new Pantallas();
  cabeza = new Circulo();

  ball= loadImage("ball.png");
  ball1= loadImage("ball1.png");
  bq= loadImage("bq.png");
  cara= loadImage("cara.png");
  st= loadImage("st.jpg");
  st1= loadImage("st1.jpg");
  st2= loadImage("st2.jpg");
  st3= loadImage("st3.jpg");
  r1= loadImage("1.png");
  r2= loadImage("2.png");
  r3= loadImage("3.png");
  r4= loadImage("4.png");
  r5= loadImage("5.png");



  B= new Barra(0, 0, 30, 960, 0, 0);
  B1= new Barra(630, 0, 30, 960, 0, 0);

  C1= new Canasta(150, 460, 30, 50, 0, 0);
  C2= new Canasta(250, 460, 30, 50, 0, 0);
}

void keyPressed() {
  p.key();
}

void draw() {
  p.logica();
}


void captureEvent(Capture c) {
  c.read();
} 
