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
}
