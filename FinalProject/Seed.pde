class Seed{
  
  //keeps track of the time passes since planted
  private float timeElapsed;
  
  //the total time needed for the seed to become a crop
  private float timeForHarvest;
  
  //tracks whether the seed has been watered for the day
  private boolean watered;
  
  //tracks the type of crop that corresponds to the type of seed
  private Crop thisCrop;
  
  public Seed(float harvestTime, Crop typeOfCrop){
    timeElapsed = 0;
    timeForHarvest = harvestTime;
    watered = false;
    thisCrop = typeOfCrop;
  }
  
  
}
