class MelonSeed extends Seed{
  float x,y;
  public MelonSeed(float x, float y){
    super(12,80,new Crop(1));
    this.x = x;
    this.y = y;
  }
  void display(){
    stroke(0);
    fill(#C17935);
    rect(x,y,24,30);
  }
  
  void newCor(float x, float y){
    this.x = x;
    this.y = y;
  }
}
