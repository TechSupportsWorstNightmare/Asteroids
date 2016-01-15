int count = 10;

<<<<<<< HEAD
Asteroid a;        //sets the asteroids class
Ship s;            //the ship's variable
float x,y, tx,ty;  //position varibales of the ship and asteroifs
=======
Asteroid[] a= new Asteroid[count];
Ship s;
float x,y, tx,ty;
>>>>>>> origin/master
PImage ast;

void setup(){
  int i =0;
 size(1024,768);
ast= loadImage("asteroids.jpg");  //loads the Asteroids start screen

<<<<<<< HEAD
s = new Ship();       //sets variable s in place of ship
a = new Asteroid();   //sets variable a in place of asteroids
int i =0;              
=======
s = new Ship();
while(i<count){
a[i] = new Asteroid();
i++;
}

>>>>>>> origin/master

}

void draw(){ 
 int i =0;
  background(0);
<<<<<<< HEAD
  a.display();       //commands for the ships
  a.move();
  a.warp();
=======
  while(i<count){
  a[i].display();
  a[i].move();
  a[i].warp();
  i++;
  }
>>>>>>> origin/master
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