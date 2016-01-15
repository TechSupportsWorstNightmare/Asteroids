Asteroid a;   //declares a as the class of asteroids
float x,y;    //declare x and y variabkes, for use of placement

PImage ast;   //load asteroids background for the start menu  
void setup(){
 size(1024,768);
ast= loadImage("asteroids.jpg"); //load the background

x=50;                   //set coordinates
y=50;
a = new Asteroid();     //begin creating asteroids

  
  
  
  
}

void draw(){ 
  background(0);   //set the black background//
  a.display();     //set the comamands for the object
  a.move();
  a.warp();
 //if(keyCode == ENTER){
 //background(0);}
 //else {
 //image(ast,0,0);
 //}
 //if(keyCode == ESC){
 // // image(help,0,0);
 //}
   
 //if(keyCode == UP){
 //y= y--; 
 //}
 //triangle(x,y -20, x-10, y, x+10, y);
  
  
  
  
  
  
}