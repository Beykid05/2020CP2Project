class Stars{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Stars(color c, float xpos, float ypos, float xspeed){
    this.c = c;
    this.xpos = xpos;
    this.ypos = ypos;
    this.xspeed = xspeed;
  }
  void display(){
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos,2,2);
}
  void drive(){
    ypos+=xspeed;
    if(ypos > height){
      ypos = 0;
    }
  }
}
