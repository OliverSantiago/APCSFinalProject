class TomatoSeed extends Seed{
  float x,y;
  TomatoSeed(float x, float y){
    super(11,50,new Crop(1));
    this.x = x;
    this.y = y;
  }
  void display(){
    stroke(0);
    fill(#C17935);
    rect(x,y,24,30);
  }
}
