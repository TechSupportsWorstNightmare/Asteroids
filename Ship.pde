class Ship {
  PVector loc, vel;
  float x1, x2, x3, y1, y2, y3;
  int i;
  Ship() { 
    loc = new PVector(mouseX, mouseY);
    vel = PVector.random2D();

    x1= loc.x;
    x2= loc.x - 10;
    x3= loc.x +10;
    y1=loc.y -10;
    y2= loc.y +10;
    y3= loc.y +10;
  }

  void update() {
    loc.set(mouseX, mouseY);
  }

  void display() {
    x1= loc.x;
    x2= loc.x - 10;
    x3= loc.x +10;
    y1=loc.y -10;
    y2= loc.y +10;
    y3= loc.y +10;
    triangle(x1, y1, x2, y2, x3, y3);
  } 
  boolean contact(Asteroid current) {
    if (loc.dist(current.loc)<10+current.diam/2) {
      return true;
    } else {
      return false;
    }
  }
  //boolean contacts(PVector loc) {
  // loc.dist(a[i].loc);
  // if (a[i].loc.dist(loc)<a[i].diam+10) {
  //   return true;
  // } else {
  // return false;
  // }
  //}
}