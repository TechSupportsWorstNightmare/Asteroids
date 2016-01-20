
class Ship {
  PVector tloc, vel;


  Ship() { 


    tloc = new PVector(tx, ty);
    vel = PVector.random2D();
  }
  void display() {
    triangle(tloc.x, tloc.y -20, tloc.x-10, tloc.y, tloc.x+10, tloc.y);
  }
  void move() {
    if (key == CODED) {
      if (keyCode == UP) {
        tloc.y= tloc.y-15;
      } else if (keyCode == DOWN) {
        tloc.y=tloc.y+15;
      }
    }
  }
}