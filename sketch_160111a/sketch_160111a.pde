int count = 10;

Asteroid a;
Ship s;
float x,y, tx,ty;
PImage ast;
void setup(){
 size(1024,768);
ast= loadImage("asteroids.jpg");

s = new Ship();
a = new Asteroid();
int i =0;

}

void draw(){ 
  background(0);
  a.display();
  a.move();
  a.warp();
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