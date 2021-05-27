class TomatoSeed extends Seed{
  float x,y;
  TomatoSeed(float x, float y){
    super(11,50,new Crop(1));
    this.x = x;
    this.y = y;
  }
  void display(){
    stroke(0);
    fill(#43760C);
    rect(x,y,24,30);
  }
  
  void newCor(float x, float y){
    this.x = x;
    this.y = y;
  }
}
