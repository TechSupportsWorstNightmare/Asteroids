import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Scrap_and_fix2 extends PApplet {







ArrayList <Bullet> bullets = new ArrayList<Bullet>();//where our bullets will be stored
ArrayList <Asteroid> a = new ArrayList<Asteroid>();

int gameMode = 0;

Ship s;

float x, y, tx, ty;
PImage ast;
int score=0;
int lives = 2;
Minim minim;
AudioPlayer player;
AudioPlayer player2;

public void setup() {
  
  strokeWeight(5);
  ast= loadImage("asteroids.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Little Einsteins Remix.mp3");
  player2 = minim.loadFile("Asteroids Game Boy Title Music.mp3");
}

public void draw() { 

  if (gameMode == 0) {
    player.play();
    //player2.play();
    background(ast);
    if (keyPressed && key == ENTER) {

      background(0);
      gameMode =1;
    }
  } else if (gameMode == 1) {
    background(0);
    fill(255);
    textMode(CENTER);
    textAlign(CENTER);
    textSize(32);
    text("Instructions\nUse your mouse to guide your ship around the screen.\nClick the mouse to shoot at the asteroids.\nEvery time an asteroid is hit by your bullet it will split in two.\nAfter splitting twice the asteroid will be destroyed.\nYou will get point for every time you hit an asteroid.\nYou will get two lives\nGood Luck!\n Press the spacebar to play.", width/2, 80);
    if (keyPressed && key == ' ') {
      for (int i = 0; i < 5; i++) { 
        a.add(new Asteroid(0, 0, 3));
      }
      gameMode=2;
      s = new Ship(width/2, height/2);
    }
  } else if (gameMode == 2) {
    
    background(0);
    if (keyPressed && keyCode == CONTROL) {

      gameMode=3;
    }
    //if (mousePressed) {
    //  bullets. add(new Bullet(s.loc.x, s.loc.y));
    //  print(s.loc);
    //}
    for (int k = bullets.size() -1; k>=0; k--) {
      Bullet b = bullets.get(k);
      b.display();
      b.move();
    }

    for (int i = a.size()-1; i >= 0; i--) {
      Asteroid asteroid = a.get(i);
      asteroid.display();
      asteroid.move();
      asteroid.warp();
      if (s.contact(asteroid)) {
        println("ship hit in frame " + frameCount);
        lives--;
        asteroid.loc.set(random(width), random(height));
      }
      if (lives<=0) {
        gameMode=4;
        player.pause();
      }
      for (int j  = bullets.size()-1; j >= 0; j--) {
        Bullet b = bullets.get(j);
        if (asteroid.contact(b)) {
          bullets.remove(j);
          a.remove(i);
          a.add(new Asteroid(asteroid.loc.x, asteroid.loc.y, asteroid.health-1));
          a.add(new Asteroid(asteroid.loc.x, asteroid.loc.y, asteroid.health-1));
          score= score+100;
          println("I've been hit in frame " + frameCount);
        }
      }
      if (asteroid.health == 0) {
        a.remove(i);
        a.add(new Asteroid(0, 0, 3));
        println("asteroid added in frame" +frameCount);
      }
    }
    fill(255);
    text("Lives: "+lives, 100, 50);
    textAlign(CENTER);
    textSize(24);
    text("Score:  "+ score, 900, 50);
    textAlign(CENTER);
    textSize(24);
    s.update();

    s.display();

    //if (s.contacts(a[i].loc)) {
    //  gameMode=4;
    //}
  } else if (gameMode==3) {
    background(0, 0, 0, 100);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("PAUSE\nMove the mouse to control the ship.\nClick the mouse to shoot\nUse left and right arrow keys to rotate the ship.\nPress the SHIFT key to resume the game.", width/2, 60);
    if (keyPressed && keyCode == SHIFT) {
      gameMode=2;
    }
  } else if ( gameMode == 4) {
    if (a.size() > 0) {
      a.clear();
    }
    background(0);
    fill(255, 100, 50);
    text("GAME OVER\n Player 1\n Score:  " + score, width/2, height/2);
    textSize(60);
    textAlign(CENTER);
    text("Press Enter to restart", width/2, height/4);
    textSize(30);
    textAlign(CENTER);
    player2.play();
    if (keyPressed && key== ENTER) {
      gameMode=2;
      score=0;
      s = new Ship(width/2, height/2);
      player2.pause();
    }
  }
  println(gameMode);
}
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
  public void display() {
    fill(0);
    stroke(255);
    ellipse(loc.x, loc.y, diam, diam);
  }

  public void move() {

    loc.add(vel);
  }
  public void warp() {
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
  public boolean contact(Bullet current) {
    if (loc.dist(current.bloc)<diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
//class Bullet//bullet class
//{
//  float x;
//  float y;
//  float speed;
//  PVector bloc, bvel;
//  Bullet(float tx, float ty) {
//    x = tx;
//    y = ty;
//    bloc=new PVector(x, y);
//    bvel= new PVector(0, -1);
//  }
//  void display() {
//    stroke(255);
//    point(x, y);
//  }
//  void move() {
//    y -= 1.5;
//    bloc.add(bvel);
//  }

//  void removeToLimit(int maxLength) {
//    while (bullets.size() > maxLength) {
//      bullets.remove(0);
//    }
//  }
//  void moveAll() {
//    for (Bullet temp : bullets) {
//      temp.move();
//    }
//  }
//  void displayAll() {
//    for (Bullet temp : bullets) {
//      temp.display();
//    }
//  }
//  void mousePressed() {//add a new bullet if mouse is clicked
//    Bullet temp = new Bullet(mouseX, mouseY);
//    bullets.add(temp);
//  }
//}
class Bullet//bullet class
{
  float speed;
  PVector bloc, bvel;
  Bullet(float tx, float ty)
  {
   
    bloc=new PVector(tx, ty);
    bvel= new PVector(0, -2);
  }
  public void display()
  {
    stroke(255);
    
    point(bloc.x,bloc.y);
  }
  public void move()
  {

    bloc.add(bvel);
  }
}

public void removeToLimit(int maxLength)
{
  while (bullets.size() > maxLength)
  {
    bullets.remove(0);
  }
}
public void moveAll()
{
  for (Bullet temp : bullets)
  {
    temp.move();
  }
}
public void displayAll()
{
  for (Bullet temp : bullets)
  {
    temp.display();
  }
}
public void mousePressed()//add a new bullet if mouse is clicked
{

 bullets.add(new Bullet(mouseX, mouseY));
}
class Ship {
  PVector loc, vel;
  float x1, x2, x3, y1, y2, y3;
  int i;
  Ship(float x,float y) { 
    loc = new PVector(mouseX, mouseY);
    vel = PVector.random2D();

    x1= loc.x;
    x2= loc.x - 10;
    x3= loc.x +10;
    y1=loc.y -10;
    y2= loc.y +10;
    y3= loc.y +10;
  }

  public void update() {
    loc.set(mouseX, mouseY);
  }

  public void display() {
    x1= loc.x;
    x2= loc.x - 10;
    x3= loc.x +10;
    y1=loc.y -10;
    y2= loc.y +10;
    y3= loc.y +10;
    triangle(x1, y1, x2, y2, x3, y3);
  } 
  public boolean contact(Asteroid current) {
    if (loc.dist(current.loc)<10+current.diam/2) {
      return true;
    } else {
      return false;
    }
  }
  //boolean contacts(PVector loc) {
  // loc.dist(a[i].loc);
  // if (a[i].loc.dist(loc)<a[i].diam+10) {
  //   return true;
  // } else {
  // return false;
  // }
  //}
}
  public void settings() {  size(1024, 768); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Scrap_and_fix2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
