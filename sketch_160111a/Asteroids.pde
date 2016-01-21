class Asteroid {
  PVector loc, vel;
  int diam;             

  Asteroid() {  

    loc = new PVector(x, y);
    vel = PVector.random2D();
    println(loc.y);
  }
  void display() {
    fill(0);
    stroke(255);
    ellipse(loc.x, loc.y, 100, 100);
  }
  void brk() {
  }

  void move() {
    loc.add(vel);
  }
  void warp() {
    if (loc.x>= width) {
      loc.x = 0;
    } else if (loc.x <= 0) {
      loc.x = width ;
    }
    if (loc.y  >= height) {
      loc.y = 0;
    } else if (loc.y  <= 0) {
      loc.y = height;
    }
  }
}