class Asteroid {
  PVector loc, vel;
  int diam;             

  Asteroid() {  
   loc = new PVector(x,y);
   vel = PVector.random2D();
}
void display(){
  fill(0);
  stroke(255);
  ellipse(loc.x, loc.y, 100,100);
  
  
}
void brk(){
  
  
}

void move(){
  loc.add(vel);
  
  
}
void warp(){
  if (x<= 0){
   x= width; 
  }
  if(x >= width){
   x= 0; 
  }
  if(y>= height){
   y = 0; 
  }
  if( y<= 0){
    
    y= height;
  }
}

}