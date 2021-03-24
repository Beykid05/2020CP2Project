class Lazer{
  int x,y,w,h,s;
  color c;
  int damage;
  PImage dart;
  
  Lazer(int x, int y){
    
    this.x = x;
    this.y = y;
    w = 5;
    h = 7;
    s = 1;
    damage = int(10);
    dart = loadImage("Dart.png");
  }
  void display(){
    image(dart,x,y);
  }
  
  void fire(){
    y-=s;
  }
  boolean reachedTop(){
    if(y<0-50){
      return true;
    }else{
      return false;
    }
  }
}
