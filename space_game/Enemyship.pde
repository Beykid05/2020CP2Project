class Enemyship{
 int x,y,w,h,s,health; //shield, fireRate
 PImage Lancer;
 //Contructor
 Enemyship(int x, int y){
   this.x = x;
   this.y = y;
   w = 10;
   h = 10;
   health = 1;
   s = 20;
   Lancer = loadImage("Lancer.png");
 }
 
 void display(){
   image(Lancer,x,y);
 }
 void drive(){
    y += s;
    if(x>= width || x<=0){
      s *= -1;
      y+=100;
    }
 }
 boolean destoyed(){
   if(h<1){
     return true;
   }else {
     return false;
   }
 }
}
