class PumpkinSeed extends Seed{
  float x,y;
  PumpkinSeed(float x, float y){
    super(13,100,new Crop(1));
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
