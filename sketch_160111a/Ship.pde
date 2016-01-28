
class Ship {         ;//sets ship class
  PVector tloc, vel;     //variables for speed


  Ship() { 
   

    tloc = new PVector(tx, ty);    //sets vector movements
    vel = PVector.random2D();
  }
  void display(){
  triangle(tloc.x, tloc.y -20, tloc.x-10, tloc.y, tloc.x+10, tloc.y);        //displays the traingle as the ship
  }
  void move(){                //uses the arrow keys to move the ship
    if (key == CODED) {
    if (keyCode == UP) {
      tloc.y= tloc.y-15;
    } else if (keyCode == DOWN) {
      tloc.y=tloc.y+15;
    }
  }
  }
}