public class Plot{
  private Seed current_seed;
  private boolean tilled;
  private boolean watered;
  private boolean ready_to_harvest;
  private boolean mouse_on = false;
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
  
  void mouse_on(){
    mouse_on = true;
  }
  
  void mouse_off(){
    mouse_on = false;
  }
  
  void display(int x, int y){
    if (tilled && !watered){
      if (mouse_on){
        strokeWeight(2);
        stroke(0);
      }else{
        noStroke();
      }
      fill(165,129,0);
      rect(x,y,30,30);
    }else if(tilled && watered){
            if (mouse_on){
        strokeWeight(2);
        stroke(0);
      }else{
        noStroke();
      }
      fill(111,81,3);
      rect(x,y,30,30);
    }else{
      if (mouse_on){
        strokeWeight(2);
        stroke(0);
      }else{
        noStroke();
      }
      fill(222,188,65);
      rect(x,y,30,30);
    }
  }
  
  void end_of_day(){
    if (watered&&current_seed!=null){
      current_seed.water();
      current_seed.addDay();
      if (current_seed.getCrop()!=null){
        current_crop = (Crop)current_seed.getCrop();
      }
      watered = false;
    }else if (watered&&current_seed==null){
      float rand = random(100);
      if (rand>25){
        watered = false;
        tilled = false;
      }
    }else{
      watered = false;
      tilled = false;
    }
  }
}
