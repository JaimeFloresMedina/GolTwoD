class Pantallas {

  Pantallas() {
  }
  void P1() {
    image(st1, 0, 0);
  }

  void P2() {
    image(st2, 0, 0);
  }
  void P3() {
    box2d.step();   

    background(255);
    image(st, 0, 0);

    pushMatrix();
    scale(-2, 2);
    opencv.loadImage(video);

    Rectangle[] faces = opencv.detect();

    popMatrix();


    for (int i = 0; i < faces.length; i++) {
      x = 270-faces[i].x;
      y = 50+faces[i].y;
    }

    cabeza.mov(2*x, 2*y);
    cabeza.display();

    B.display();
    B1.display();


    z+=e;
    if (z>=430) {

      e*=-1;
    } else if (z<0) {
      e*=-1;
    }

    C1.mover(z);
    C2.mover(z+100);
    C1.display();
    C2.display();

    if (paso==true) {
      if (doble) {

        if (pelotas.size()==0) {
          q=int(random(2));
          Pelota o = new Pelota(random(150, 450), 0, q);
          pelotas.add(o);
          Pelota r = new Pelota(random(150, 450), -200, q);
          pelotas.add(r);
        }
      } else {
        q=int(random(2));
        Pelota o = new Pelota(random(150, 450), 0, q);
        pelotas.add(o);
      }
    }


    for (int i = pelotas.size()-1; i>=0; i--) {
      boolean r = pelotas.get(i).estaEnPantalla();
      boolean w = pelotas.get(i).win();
      if (r) {  
        pelotas.get(i).display();
      } else {

        pelotas.remove(i);
      }
      if (Pantalla==3) {
        pelotas.remove(i);
      }

      if (w) {
        if (l==1) {
          lose--;
          contador=contador +  pelotas.get(i).Pt();
        }
      }
    }

    if ((contador>=6 && contador <=9) || (contador>=16 && contador <=19) || (contador>=26 && contador <=29) || (contador>=31 && contador <=39)) {
      doble=true;
      my++;
      if (my==1) {
        lose = lose-8;
      }
    } else {
      doble=false;
    }


    if (lose>=10) {
      Pantalla=3;
      Rc=contador;
      yu=yu+1;
      record[yu-1]=Rc;
    }


    fill(255);
    textSize(25);
    text(lose, 515, 109);

    fill(255, 0, 0, 200);
    rectMode(CORNER);
    rect(50+z, 450, 100, 45);

    imageMode(CORNER);
    image(bq, 35+z, 432);
    fill(255);
    textSize(25);
    text(contador, 555, 73);
  }
  void P4() {
    image(st3, 0, 0);
    m=millis()/100;
    Rc2=Rc;
    if (Rc2>Rc1) {
      rcd=true;
    }


    if (rcd) {
      if (m%5==1) {
        image(r1, 0, 0);
        fill(#FFD427);
      }
      if (m%5==2) {
        image(r2, 0, 0);
        fill(#FF6F27);
      }
      if (m%5==3) {
        image(r3, 0, 0);
        fill(#D30F0F);
      }
      if (m%5==4) {
        image(r2, 0, 0);
        fill(#FF6F27);
      }
      if (m%5==0) {
        image(r3, 0, 0);
        fill(#D30F0F);
      }
    }
    textSize(40);
    text(record[yu-1], 550, 150);
    Rc1=max(record);
    fill(255);
    text(Rc1, 80, 150);

    for (int i = pelotas.size()-1; i>=0; i--) {
      pelotas.remove(i);
    }
  }

  void reiniciar() {
    Pantalla=2;
    contador=0;
    paso=true;
    doble=false;
    lose=0;
    e=10;
    rcd=false;
    m=0;
  }

  void key() {
    if (Pantalla==0) {
      if (key=='\n') {
        Pantalla=1;
        key=0;
      }
    }
    if (Pantalla==1) {
      if (key=='\n') {
        Pantalla=2;
      }
    }
    if (Pantalla==3) {
      if (key=='\n') {
        Pantalla=2;
        p.reiniciar();
      }
    }
  }

  void logica() {
    if (Pantalla==0) {
      p.P1();
    }
    if (Pantalla==1) {
      p.P2();
    }
    if (Pantalla==2) {
      p.P3();
    }
    if (Pantalla==3) {
      p.P4();
    }
  }
}
