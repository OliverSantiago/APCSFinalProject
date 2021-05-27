class CornSeed extends Seed{
  CornSeed(){
    super(14,20,new Crop(1));
  }
  void display(){
    stroke(0);
    fill(#C17935);
    rect(width/2,height/2,24,30);
    fill(#6A4142);
    ellipse(width/2+12,height/2+18, 10,15);
  }
}
