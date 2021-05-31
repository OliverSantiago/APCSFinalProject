class Seed extends Item{
  //float x,y;
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
    if (seed_type == 1.0){
      corn = true;
      daysForHarvest = 14;
      value = 20;
    }
    if (seed_type == 2.0){
      melon = true;
      daysForHarvest = 18;
      value = 80;
    }
    if (seed_type == 3.0){
      potato = true;
      daysForHarvest = 6; 
      value = 50;
    }
    if (seed_type == 4.0){
      pumpkin = true;
      daysForHarvest = 13;
      value = 100;
    }
    if (seed_type == 5.0){
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
  
  //void newCor(float x, float y){
  //  this.x = x;
  //  this.y = y;
  //}
  
  String get_Class(){
    return "Seed";
  }
  
  int get_type(){
    if (corn){
      return 1;
    }
    if (melon){
      return 2;
    }
    if (potato){
      return 3;
    }
    if (pumpkin){
      return 4;
    }
    if (tomato){
      return 5;
    }
    return -1;
  }
  
  void display(int x,int y){
    if (corn){
      stroke(0);
      strokeWeight(1);
      fill(#FFE667);
      rect(x,y,24,30);
      fill(#FAE949);
      ellipse(x+12,y+17,8,18);
      stroke(#128B27);
      strokeWeight(4);
      bezier(x+12,y+24,x+9,y+23,x+8,y+22,x+7,y+18);
      strokeWeight(2);
      bezier(x+12,y+24,x+15,y+23,x+16,y+22,x+17,y+18);
    }
    if (melon){
      stroke(0);
      strokeWeight(1);
      fill(#E898B0);
      rect(x,y,24,30);
      fill(#FFA5D5);
      ellipse(x+12,y+18,12,12);
      stroke(#128B27);
      strokeWeight(3);
      bezier(x+9,y+13,x+8,y+12,x+6,y+13,x+5,y+16);
      bezier(x+9,y+13,x+9,y+11,x+10,y+10,x+11,y+10);
    }
    if (potato){
      stroke(0);
      strokeWeight(1);
      fill(#C17935);
      rect(x,y,24,30);
      fill(#7C5141);
      ellipse(x+12,y+18,12,15);
    }
    if (pumpkin){
      stroke(0);
      strokeWeight(1);
      fill(#FFE667);
      rect(x,y,24,30);
      fill(#C66C38);
      ellipse(x+12,y+18,18,18);
      stroke(#AA4C15);
      strokeWeight(2);
      bezier(x+12,y+9,x+6,y+14,x+6,y+21,x+11,y+26);
      bezier(x+12,y+10,x+18,y+14,x+18,y+21,x+14,y+26);
      stroke(#0D3405);
      strokeWeight(4);
      bezier(x+12,y+9,x+14,y+8,x+15,y+7,x+16,y+7);
    }
    if (tomato){
      stroke(0);
      strokeWeight(1);
      fill(#43760C);
      rect(x,y,24,30);
      fill(#9B1313);
      ellipse(x+12,y+19,13,12);
      stroke(#0D3405);
      strokeWeight(3);
      bezier(x+12,y+13,x+11,y+12,x+10,y+11,x+9,y+11);
      bezier(x+11,y+13,x+10,y+12,x+9,y+12,x+7,y+13);
      bezier(x+12,y+13,x+14,y+12,x+15,y+11,x+16,y+11);
    }
  }
}
