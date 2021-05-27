class Seed extends Item{
  float x,y;
  //keeps track of the time passes since planted
  private float daysElapsed;
  
  //the total time needed for the seed to become a crop
  private float daysForHarvest;
  
  //tracks whether the seed has been watered for the day
  private boolean watered;
  
  //tracks the type of crop that corresponds to the type of seed
  private Item crop;
  
  private float value;
 
  private boolean corn,melon,potato,pumpkin,tomato;
  
  public Seed(float seed_type){
    daysElapsed = 0;
    watered = false;
    crop = new Crop(-1);
    if (seed_type == 1){
      corn = true;
      daysForHarvest = 14;
      value = 20;
    }
    if (seed_type == 2){
      melon = true;
      daysForHarvest = 18;
      value = 80;
    }
    if (seed_type == 3){
      potato = true;
      daysForHarvest = 6; 
      value = 50;
    }
    if (seed_type == 4){
      pumpkin = true;
      daysForHarvest = 13;
      value = 100;
    }
    if (seed_type == 5){
      tomato = true;
      daysForHarvest = 11;
      value = 50;
    }
  }
  
  //returns whether the seed has been watered
  boolean isWatered(){
    return watered;
  }
  
  //returns corresponding crop
  Item getCrop(){
    if (daysElapsed >= daysForHarvest){
      return crop;
    }
    return null;
  }
  
  float getDaysElapsed(){
    return daysElapsed;
  }
  
  
  //increments days elapsed if plant has been watered
  void addDay(){
    if (watered){
      daysElapsed++;
    }
    watered = false;
  }
  
  //sets watered to true
  void water(){
    watered = true;
  }
  
  float getPrice(){
    return value;
  }
  
  void newCor(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    if (corn){
      stroke(0);
      fill(#E3CE30);
      rect(x,y,24,30);
    }
    if (melon){
      stroke(0);
      fill(#E898B0);
      rect(x,y,24,30);
    }
    if (potato){
      stroke(0);
      fill(#C17935);
      rect(x,y,24,30);
    }
    if (pumpkin){
      stroke(0);
      fill(#FFE667);
      rect(x,y,24,30);
    }
    if (tomato){
      stroke(0);
      fill(#43760C);
      rect(x,y,24,30);
    }
  }
}
