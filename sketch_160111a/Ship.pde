
class Ship {
  PVector tloc, vel;


  Ship() { 


    tloc = new PVector(mouseX, mouseY);
    vel = PVector.random2D();
  }
  void display() {
    triangle(mouseX, mouseY -10,mouseX -10, mouseY+10, mouseX +10, mouseY+10);
  }
  void move() {
    
  }
}