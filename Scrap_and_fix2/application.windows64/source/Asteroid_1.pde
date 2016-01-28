class Asteroid {
  PVector loc, vel;
  float diam;    
  int health;

  Asteroid(float x, float y, int thealth) {  
    health=thealth;
    if(health==3){
      diam=200;
    }else if(health==2){
      diam=100;
    }else if(health==1){
      diam=50;
    }
    loc = new PVector(x, y);
    vel = PVector.random2D();
    println(loc.y);
  }
  void display() {
    fill(0);
    stroke(255);
    ellipse(loc.x, loc.y, diam, diam);
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
  boolean contact(Bullet current) {
    if (loc.dist(current.bloc)<diam/2) {
      return true;
    } else {
      return false;
    }
  }
}