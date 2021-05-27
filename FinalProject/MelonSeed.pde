class MelonSeed{
  float x,y;
  public MelonSeed(float x, float y){
    this.x = x;
    this.y = y;
  }
  void display(){
    stroke(0);
    fill(#E898B0);
    rect(x,y,24,30);
  }
  
  void newCor(float x, float y){
    this.x = x;
    this.y = y;
  }
}
