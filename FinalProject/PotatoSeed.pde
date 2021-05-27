class PotatoSeed{
  float x,y;
  PotatoSeed(float x, float y){
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
