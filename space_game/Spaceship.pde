class Spaceship{
 int x,y,w,h,health; //shield, fireRate
 PImage butterfly;
 
 //Contructor
 Spaceship(int x, int y){
   this.x = x;
   this.y = y;
   w = 20;
   h = 20;
   health = 100;
   butterfly = loadImage("butterfly.png");
 }
 
 void display(int tempX, int tempY){
   x = tempX;
   y = tempY;
   imageMode(CENTER);
   image(butterfly,x,y);
 }
}
