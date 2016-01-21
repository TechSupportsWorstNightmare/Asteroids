
class Ship {
  PVector tloc, vel;
  int spin;
  float x1, x2, x3, y1, y2, y3;

  Ship() { 
    x1= mouseX;
    x2= mouseX - 10;
    x3= mouseX +10;
    y1=mouseY -10;
    y2= mouseY +10;
    y3= mouseY +10;
    spin = 0;
    tloc = new PVector(mouseX, mouseY);
    vel = PVector.random2D();
  }
  void display() {
    x1= mouseX;
    x2= mouseX - 10;
    x3= mouseX +10;
    y1=mouseY -10;
    y2= mouseY +10;
    y3= mouseY +10;
    triangle(x1, y1, x2, y2, x3, y3);
  }
  void spin() {
    if (keyPressed && key == LEFT) {
      rotate(PI/3);
      triangle(x1, y1, x2, y2, x3, y3);
    }
  }
}