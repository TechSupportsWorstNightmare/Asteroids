import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int count = 10;
int gameMode = 0;
Asteroid[] a= new Asteroid[count];
Ship s;
float x, y, tx, ty;
PImage ast;

void setup() {
  int i =0;
  size(1024, 768);
  ast= loadImage("asteroids.jpg");

  s = new Ship();
  while (i<count) {
    a[i] = new Asteroid();
    i++;
  }
}

void draw() { 
  int i =0;
  if (gameMode == 0) {
    background(ast);
    if (keyPressed && key == ENTER) {
      println("switched game mode in frame " + frameCount);
      background(0);
      gameMode =1;
    }
  } else if (gameMode == 1) {
    background(0);
    fill(255);
    textMode(CENTER);
    textAlign(CENTER);
    textSize(32);
    text("Instructions\nUse your mouse to guide your ship around the screen.\nUse the left and right arrow keys to rotate the ship.\nClick the mouse to shoot at the asteroids.\nEvery time an asteroid is hit by your bullet it will split in two.\nAfter splitting twice the asteoid will be destroyed.\nYou will get point for every time you hit an asteroid.\nYou will get two lives\nGood Luck!\n Press the spacebar to play.", width/2, 80);
    if (keyPressed && key == ' ') {
      gameMode=2;
    }
  } else if (gameMode == 2) {
    background(0);
    while (i<count) {
      a[i].display();
      a[i].move();
      a[i].warp();
      i++;
      if (keyPressed && keyCode == CONTROL) {
        println("go to pause in frame " + frameCount);
        gameMode=3;
      }
    }
  } else if (gameMode==3) {
    background(0, 0, 0, 100);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("PAUSE\nMove the mouse to control the ship.\nClick the mouse to shoot\nUse left and right arrow keys to rotate the ship.\nPress the SHIFT key to resume the game.", width/2, 60);
    if (keyPressed && keyCode == SHIFT) {
      gameMode=2;
    }
  }
  println(gameMode);
  s.display();
  s.move();
}
//while(i<count){
//a[i].display();
//a[i].move();
//a[i].warp();
//i++;
//}
//s.display();
//s.move();
//if(keyCode == ENTER){
//background(0);}
//else {
//image(ast,0,0);
//}
//if(keyCode == ESC){
// // image(help,0,0);
//}