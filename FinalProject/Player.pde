public class Player{
  float x, y;
  
  Player(float x, float y){
    this.x = x;
    this.y = y;
  }
 
  void display(){
    stroke(0);
    fill(0,203,103);
    rect(x,y,10,10);
  }
  
  void Up(){
    y-=10;
  }
  
  void Down(){
    y+=10;
  }
  
  void Left(){
    x-=10;
  }
  
  void Right(){
    x+=10;
  }
}
