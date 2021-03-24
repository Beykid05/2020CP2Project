class Enemylazer{
  int x,y,w,h,s;
  color c;
  int damage;
  PImage dart2;
  
  Enemylazer(int x, int y){
    
    this.x = x;
    this.y = y;
    w = 3;
    h = 7;
    s = 1;
    damage = int(15);
    dart2 = loadImage("Dart2.png");
  }
  void display(){ 
    image(dart2,x,y);
  }
  void fire(){
    y-=s;
  }
  boolean reachedBottom(){
    if (y>0+50){
      return true;
    }else{
      return false;
    }
  }
}
