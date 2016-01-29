class Asteroid {       //sets asteroid class
  PVector loc, vel;     //sets vectors of asteroids and shape
  int diam;                

  Asteroid() {       
     
   loc = new PVector(x,y);      //asteroid velocity parameters
   vel = PVector.random2D();
   println(loc.y);
  
}
void display(){           //sets parameters of the asteroid dimensions and coordinates
  fill(0);                //asteroid color 
  stroke(255);
  ellipse(loc.x, loc.y, 100,100);
  
  
}
void brk(){    //
  
  
}

void move(){
  loc.add(vel);
  
  
}
void warp(){       //allows balls to move around
 if (loc.x>= width) {    //when asteroid reaches width parameters, allows asteroids to go to the other side
    loc.x = 0;     
  } else if (loc.x <= 0) {
    loc.x = width ;
  }
  if (loc.y  >= height) {     //when asteroid reaches top or bottom, allows asteroid to appear on other side
    loc.y = 0;
  } else if (loc.y  <= 0) {
    loc.y = height;
  }
}
}