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
  void display()
  {
    stroke(255);
    
    point(bloc.x,bloc.y);
  }
  void move()
  {

    bloc.add(bvel);
  }
}

void removeToLimit(int maxLength)
{
  while (bullets.size() > maxLength)
  {
    bullets.remove(0);
  }
}
void moveAll()
{
  for (Bullet temp : bullets)
  {
    temp.move();
  }
}
void displayAll()
{
  for (Bullet temp : bullets)
  {
    temp.display();
  }
}
void mousePressed()//add a new bullet if mouse is clicked
{

 bullets.add(new Bullet(mouseX, mouseY));
}