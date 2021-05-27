class CornSeed extends Seed{
  float x, y;
  CornSeed(float x, float y){
    super(14,20,new Crop(1));
    this.x = x;
    this.y = y;
  }
  void display(){
    stroke(0);
    fill(#E3CE30);
    rect(x,y,24,30);
  }
  
  void newCor(float x, float y){
    this.x = x;
    this.y = y;
  }
}
