class Bosslazer{
  int x,y,w,h,s;
  color c;
  int damage;
  PImage bossdart;
  
  Bosslazer(int x, int y){
    
    this.x = x;
    this.y = y;
    w = 3;
    h = 7;
    s = 1;
    damage = int(50);
    bossdart= loadImage("Bossdart.png");
  }
  void display(){
    image(bossdart,x,y);
  }
  void fire(){
    y+=s;
  }
  boolean reachedBottom(){
    if (y>0+50){
      return true;
    }else{
      return false;
    }
  }
}
