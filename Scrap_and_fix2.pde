import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
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

void setup() {
  size(1024, 768);
  strokeWeight(5);
  ast= loadImage("asteroids.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Little Einsteins Remix.mp3");
  player2 = minim.loadFile("Asteroids Game Boy Title Music.mp3");
  s = new Ship();

  a.add(new Asteroid(0, 0, 3));
}

void draw() { 

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
    text("Instructions\nUse your mouse to guide your ship around the screen.\nUse the left and right arrow keys to rotate the ship.\nClick the mouse to shoot at the asteroids.\nEvery time an asteroid is hit by your bullet it will split in two.\nAfter splitting twice the asteoid will be destroyed.\nYou will get point for every time you hit an asteroid.\nYou will get two lives\nGood Luck!\n Press the spacebar to play.", width/2, 80);
    if (keyPressed && key == ' ') {
      for (int i = 0; i < 5; i++) { 
        a.add(new Asteroid(0, 0, 3));
      }
      gameMode=2;
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
        asteroid.loc.set(random(width),random(height));
      }
      if(lives==0){
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
      gameMode=0;
      player2.pause();
    }
  }
  println(gameMode);
}