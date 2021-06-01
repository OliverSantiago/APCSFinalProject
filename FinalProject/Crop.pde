class Crop extends Item{
  private float value;
  private String quality;
  
  private boolean corn,melon,potato,pumpkin,tomato;
  
  public Crop(float crop_type){
    if (crop_type == 1.0){
      corn = true;
      value = 50;
    }
    if (crop_type == 2.0){
      melon = true;
      value = 250;
    }
    if (crop_type == 3.0){
      potato = true; 
      value = 80;
    }
    if (crop_type == 4.0){
      pumpkin = true;
      value = 320;
    }
    if (crop_type == 5.0){
      tomato = true;
      value = 80;
    }
    
    float rand = random(100);
    if (rand < 70){
      quality = "standard";
    }
    else if (rand < 90){
      quality = "silver";
      value *= 1.2;
    }
    else if (rand < 100){
      quality = "gold";
      value *= 1.5;
    }
  }
  
  String get_Class(){
    return "Crop";
  }
  
  float getPrice(){
    return value;
  }
  
  String getQuality(){
    return quality;
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
  
  void display(int x, int y){
    if (corn){
      stroke(0);
      strokeWeight(1);
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
      fill(#7C5141);
      ellipse(x+12,y+18,12,15);
    }
    if (pumpkin){
      stroke(0);
      strokeWeight(1);
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
