class Tool extends Item{
  boolean watering_can;
  boolean hoe;
  
  public Tool(){
    watering_can = false;
    hoe = false;
  }
  
  void set_watering_can(){
    hoe = false;
    watering_can = true;
  }
  
  void set_hoe(){
    watering_can = false;
    hoe = true;
  }
  
  String get_Class(){
    return "Tool";
  }
  
  String tool_type(){
    if (watering_can){
      return "watering_can";
    }
    return "hoe";
  }
  
  void display(int x, int y){
    if (watering_can){
      stroke(#5D3526);
      strokeWeight(10);
      line(x,y+35,x+15,y-3);
      stroke(0);
      strokeWeight(20);
      line(x+15,y,x+25,y+15);
      strokeWeight(1);    
    }
    if (hoe){
      noStroke();
      fill(64,101,245);
      rect(x-3,y+10,20,20);
      strokeWeight(5);
      stroke(64,101,245);
      line(x+15,y+10,x+22,y+5);
      noStroke();
      fill(64,101,245);
      rect(x+21,y+2,10,10);
      strokeWeight(1);
    }
  }
}
