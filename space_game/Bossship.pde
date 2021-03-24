class Bossship{
 int x,y,w,h,health; //shield, fireRate
 PImage Bossship;
 
 //Contructor
 Bossship(int x, int y){
   this.x = x;
   this.y = y;
   w = 200;
   h = 100;
   health = 690;
   Bossship = loadImage("Bossship.png");
 }
 
 void display(int tempX, int tempY){
   x = tempX;
   y = tempY;
   imageMode(CENTER);
   image(Bossship,x,y);
 }
}
