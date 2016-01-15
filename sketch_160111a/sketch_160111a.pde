int count = 10;

Asteroid a;        //sets the asteroids class
Ship s;            //the ship's variable
float x,y, tx,ty;  //position varibales of the ship and asteroifs
PImage ast;

void setup(){
 size(1024,768);
ast= loadImage("asteroids.jpg");  //loads the Asteroids start screen

s = new Ship();       //sets variable s in place of ship
a = new Asteroid();   //sets variable a in place of asteroids
int i =0;              

}

void draw(){ 
  background(0);
  a.display();       //commands for the ships
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