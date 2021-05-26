public class Plot{
  private Seed current_seed;
  private boolean tilled;
  private boolean watered;
  private boolean ready_to_harvest;
  private Crop current_crop;
  
  //Default constructor for new plot
  Plot(){
    tilled = false;
    watered = false;
    ready_to_harvest = false;
  }
  
  
  void till(){
    tilled = true;
  }
  
  void water(){
    if (tilled){
      watered = true;
    }
  }
  
  void plant(Seed s){
    if (watered){
      current_seed = s;
    }
  }
  
  Crop harvest(){
    if (ready_to_harvest){
      return current_crop;
    }
    return null;
  }
  void display(){
    if (tilled && !watered){
      //Need to Complete
    }else if(tilled && watered){
      //Need to Complete
    }else{
      //Need to Complete
    }
  }
  
  void end_of_day(){
    if (watered){
      current_seed.water();
      current_seed.addDay();
      if (current_seed.getCrop()!=null){
        current_crop = current_seed.getCrop();
      }
      watered = false;
    }
  }
}
