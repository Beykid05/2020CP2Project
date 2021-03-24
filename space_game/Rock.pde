class Rock{
  //member var
  int x,y,w,h,health,s;
  PImage rock;
  PImage heathitem;
  int rand;
  boolean isPu;


  
  //constuctor
 Rock(int x, int y, int w, int h){
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   health = 10;
   s = int(random(2,8));
   //if(random(100)>90){}
   isPu = false;
   rock = loadImage("rock.png");
   //heathitem = loadImage("Heath item.png");

   
 }
 //display method
  void display(){
    if(y>height){
      y=int(random(-5000,0));
    }
    imageMode(CENTER);
    image(rock,x,y);
  }
  //move method
  void move(){
    y += s;
  }
    boolean reachedBottom(){
    if(y>height+50){
      return true;
    }else{
      return false;
    }
  }
}
