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
  
  boolean plant(Item s){
    if (watered && current_seed == null && current_crop == null){
      current_seed = (Seed)s;
      return true;
    }
    return false;
  }
  
  Item harvest(){
    if (ready_to_harvest){
      Item temp = current_crop;
      current_crop = null;
      current_seed = null;
      ready_to_harvest = false;
      return temp;
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
    if (current_seed != null){
      noStroke();
      if (current_seed.percent_grown() < 50){
        fill(#46E53F);
        circle(x+15,y+15,5);
      }
      else if (current_seed.percent_grown() < 100){
        fill(#46E53F);
        circle(x+15,y+15,10);
      }
      if (current_seed.percent_grown() == 100){
        fill(#46E53F);
        circle(x+15,y+15,15);
      }
    }
  }
  
  void end_of_day(){
    if (watered&&current_seed!=null){
      current_seed.water();
      current_seed.addDay();
      if (current_seed.getCrop()!=null){
        current_crop = (Crop)current_seed.getCrop();
      }
      if (current_seed.is_grown()){
        ready_to_harvest = true;
      }
    }else if (watered&&current_seed==null){
      float rand = random(100);
      if (rand>25){
        tilled = false;
      }
    }else if (current_seed==null&&current_crop==null){
      tilled = false;
    }
    watered = false;
  }
}
