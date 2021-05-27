class PumpkinSeed{
  float x,y;
  PumpkinSeed(float x, float y){
    this.x = x;
    this. y = y;
  }
  void display(){
    stroke(0);
    fill(#FFE667);
    rect(x,y,24,30);
  }
  
  void newCor(float x, float y){
    this.x = x;
    this.y = y;
  }
}
