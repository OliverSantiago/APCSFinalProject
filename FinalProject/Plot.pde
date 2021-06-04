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
    if (tilled && current_seed == null && current_crop == null){
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
      plant_display(x,y);
    }
  }
  
  void plant_display(int x, int y){
    noStroke();
    if (current_seed.percent_grown() < 25){
      stroke(0);
      strokeWeight(1);
      fill(#764B08);
      circle(x+15,y+20,3);
      circle(x+20,y+15,2);
      circle(x+12,y+12,3);
       
    }
    else if (current_seed.percent_grown() < 50){
      if (current_crop.get_type() == 1){
        stroke(#07790C);
        strokeWeight(3);
        bezier(x+15,y+14,x+16,y+9,x+18,y+12,x+19,y+14);
        strokeWeight(2);
        bezier(x+15,y+15,x+12,y+10,x+12,y+14,x+11,y+15);
        stroke(#026C06);
        strokeWeight(2);
        line(x+15,y+20,x+15,y+11);
      }
      if (current_crop.get_type() == 2){
        stroke(#07790C);
        strokeWeight(2);
        line(x+15,y+20,x+15,y+11);
        noStroke();
        fill(#07790C);
        ellipse(x+11,y+14,7,5);
        ellipse(x+20,y+14,7,5);
      }
      if (current_crop.get_type() == 3){
        stroke(#07790C);
        strokeWeight(2);
        line(x+15,y+21,x+15,y+14);
        strokeWeight(5);
        line(x+17,y+16,x+12,y+13);
      }
      //fill(#46E53F);
      //circle(x+15,y+15,10);
    }
    else if (current_seed.percent_grown() < 75){
      
    }
    else if (current_seed.percent_grown() < 100){
      
    }
    else{
      fill(#43FF2C);
      circle(x+15,y+15,17);
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
    }else if (watered&&current_seed==null&&current_crop==null){
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
