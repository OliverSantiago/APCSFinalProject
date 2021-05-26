class Seed{
  
  //keeps track of the time passes since planted
  private float daysElapsed;
  
  //the total time needed for the seed to become a crop
  private float daysForHarvest;
  
  //tracks whether the seed has been watered for the day
  private boolean watered;
  
  //tracks the type of crop that corresponds to the type of seed
  private Crop thisCrop;
  
  public Seed(float harvestTime, Crop typeOfCrop){
    daysElapsed = 0;
    daysForHarvest = harvestTime;
    watered = false;
    thisCrop = typeOfCrop;
  }
  
  //returns whether the seed has been watered
  boolean isWatered(){
    return watered;
  }
  
  //returns corresponding crop
  Crop getCrop(){
    if (daysElapsed >= daysForHarvest){
      return thisCrop;
    }
    return null;
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
}
