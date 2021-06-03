class Tool extends Item{
  boolean watering_can;
  boolean hoe;
  
  public Tool(int select){
    if (select == 1){
      watering_can = true;
      hoe = false;
    }else{
      hoe = true;
      watering_can = false;
    }
  }
  
  String get_Class(){
    return "Tool";
  }
  
  String tool_type(){
    if (watering_can){
      return "watering_can";
    }else if (hoe){
      return "hoe";
    }
    return "You broke the game somehow?";
  }
  
  void display(int x, int y){
    if (watering_can){
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
    if (hoe){
      stroke(160,111,13);
      strokeWeight(10);
      line(x,y+35,x+15,y-3);
      strokeWeight(20);
      line(x+15,y,x+25,y+15);
      strokeWeight(1);  
    }
  }
}
