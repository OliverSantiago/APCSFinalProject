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
}
