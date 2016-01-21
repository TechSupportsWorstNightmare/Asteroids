int count = 10;


Asteroid[] a= new Asteroid[count];
Ship s;
float x,y, tx,ty;

PImage ast;

void setup(){
  int i =0;
 size(1024,768);
ast= loadImage("asteroids.jpg");  //loads the Asteroids start screen


s = new Ship();
while(i<count){
a[i] = new Asteroid();
i++;
}



}

void draw(){ 
 int i =0;
  background(0);

  while(i<count){
  a[i].display();
  a[i].move();
  a[i].warp();
  i++;
  }

  s.display();
  s.move();
 //if(keyCode == ENTER){
 //background(0);}
 //else {
 //image(ast,0,0);
 //}
 //if(keyCode == ESC){
 // // image(help,0,0);
 //}

  
  
  
  
  
  
}