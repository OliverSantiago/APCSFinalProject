class Crop{
  private float value;
  private String quality;
  
  public Crop(float cropWorth){
    float rand = random(100);
    if (rand < 80){
      quality = "standard";
      value = cropWorth;
    }
    else if (rand < 95){
      quality = "silver";
      value = (float) cropWorth * 1.2;
    }
    else if (rand < 100){
      quality = "gold";
      value = (float) cropWorth * 1.5;
    }
  }
}
