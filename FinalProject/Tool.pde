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
      //noStroke();
      //fill(64,101,245);
      //rect(x-3,y+10,20,20);
      //strokeWeight(5);
      //stroke(64,101,245);
      //line(x+15,y+10,x+22,y+5);
      //noStroke();
      //fill(64,101,245);
      //rect(x+21,y+2,10,10);
      strokeWeight(1);
      stroke(0);
      fill(64,101,245);
      beginShape();
      vertex(x+3,y+2);//262,718
      vertex(x-4,y+6);
      vertex(x-4,y+27);
      vertex(x+3,y+32);
      vertex(x+10,y+32);
      vertex(x+17,y+27);
      vertex(x+17,y+11);
      vertex(x+25,y+7);
      vertex(x+32,y+11);
      vertex(x+31,y-4);
      vertex(x+25,y+2);
      vertex(x+19,y+4);
      vertex(x+10,y+2);
      vertex(x+3,y+2);
      endShape();
    }
    if (hoe){
      stroke(160,111,13);
      strokeWeight(7);
      line(x,y+30,x+15,y+3);
      strokeWeight(15);
      stroke(100);
      line(x+15,y+3,x+25,y+10);
      strokeWeight(1);  
    }
  }
}
