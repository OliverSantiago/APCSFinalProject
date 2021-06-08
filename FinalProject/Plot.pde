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
      //fill(222,188,65);
      fill(250,219,116);
      rect(x,y,30,30);
    }
    if (current_seed != null){
      plant_display(x,y);
    }
  }
  
  void plant_display(int x, int y){
    noStroke();
    if (current_seed.percent_grown() < 10){
      stroke(0);
      strokeWeight(1);
      fill(#764B08);
      circle(x+15,y+20,3);
      circle(x+20,y+15,2);
      circle(x+12,y+12,3);
     
    }
    else if (current_seed.percent_grown() < 40){
      if (current_seed.get_type() == 1){
        stroke(#07790C);
        strokeWeight(3);
        bezier(x+15,y+14,x+16,y+9,x+18,y+12,x+19,y+14);
        strokeWeight(2);
        bezier(x+15,y+15,x+12,y+10,x+12,y+14,x+11,y+15);
        stroke(#026C06);
        strokeWeight(2);
        line(x+15,y+20,x+15,y+11);
      }
      if (current_seed.get_type() == 2){
        stroke(#07790C);
        strokeWeight(2);
        line(x+15,y+20,x+15,y+11);
        noStroke();
        fill(#07790C);
        ellipse(x+11,y+14,7,5);
        ellipse(x+20,y+14,7,5);
      }
      if (current_seed.get_type() == 3){
        stroke(#07790C);
        strokeWeight(2);
        line(x+15,y+21,x+15,y+14);
        strokeWeight(5);
        line(x+17,y+16,x+12,y+13);
      }
      if (current_seed.get_type() == 4){
        noStroke();
        fill(#337E36);
        rect(x+14,y+18,3,5);
        ellipse(x+15,y+15,6,9);
      }
      if (current_seed.get_type() == 5){
        stroke(#07790C);
        strokeWeight(4);
        line(x+15,y+20,x+15,y+18);
        stroke(#41BF46);
        line(x+15,y+17,x+12,y+14);
        line(x+15,y+17,x+17,y+12);
      }
    }
    else if (current_seed.percent_grown() < 70){
      if (current_seed.get_type() == 1){
        stroke(#07790C);
        strokeWeight(3);
        bezier(x+15,y+15,x+17,y+10,x+20,y+14,x+21,y+16);
        bezier(x+15,y+15,x+10,y+10,x+12,y+14,x+9,y+16);
        strokeWeight(2);
        line(x+15,y+11,x+11,y+10);
        line(x+15,y+11,x+19,y+9);
        stroke(#026C06);
        strokeWeight(4);
        line(x+15,y+20,x+15,y+8);
      }
      if (current_seed.get_type() == 2){
        stroke(#07790C);
        strokeWeight(2);
        fill(#07790C);
        ellipse(x+15,y+18,5,8);
        noStroke();
        fill(#07790C);
        ellipse(x+11,y+14,7,5);
        ellipse(x+20,y+14,7,5);
      }
      if (current_seed.get_type() == 3){
        stroke(#07790C);
        strokeWeight(4);
        line(x+15,y+21,x+15,y+14);
        strokeWeight(7);
        line(x+17,y+16,x+12,y+13);
        noStroke();
        fill(#07790C);
        circle(x+21,y+16,7);
      }
      if (current_seed.get_type() == 4){
        noStroke();
        fill(#337E36);
        rect(x+14,y+18,3,5);
        ellipse(x+10,y+15,8,7);
        stroke(#337E36);
        strokeWeight(8);
        line(x+17,y+13,x+18,y+11);
        stroke(#055508);
        strokeWeight(1);
        ellipse(x+15,y+15,6,8);
      }
      if (current_seed.get_type() == 5){
        stroke(#469349);
        strokeWeight(4);
        line(x+15,y+22,x+15,y+9);
        stroke(#53A556);
        line(x+19,y+11,x+22,y+14);
        line(x+11,y+17,x+8,y+15);
        strokeWeight(6);
        line(x+17,y+17,x+18,y+19);
        line(x+12,y+8,x+8,y+9);
      }
    }
    else if (current_seed.percent_grown() < 100){
      if (current_seed.get_type() == 1){
        stroke(#026C06);
        strokeWeight(5);
        line(x+15,y+23,x+15,y+7);
        stroke(#07790C);
        strokeWeight(5);
        bezier(x+15,y+20,x+17,y+15,x+20,y+19,x+21,y+21);
        bezier(x+15,y+20,x+10,y+15,x+12,y+19,x+9,y+21);
        
        bezier(x+15,y+10,x+17,y+10,x+20,y+11,x+21,y+13);
        strokeWeight(3);
        line(x+14,y+9,x+11,y+13);
      }
      if (current_seed.get_type() == 2){
        stroke(#4A954D);
        strokeWeight(4);
        line(x+15,y+22,x+15,y+18);
        noStroke();
        fill(#FFA5D5);
        circle(x+20,y+21,6);
        stroke(#07790C);
        strokeWeight(2);
        fill(#07790C);
        ellipse(x+15,y+15,5,10);
        stroke(#048309);
        strokeWeight(6);
        line(x+19,y+14,x+20,y+15);
        line(x+11,y+14,x+10,y+15);
        fill(#07790C);
        noStroke();
        ellipse(x+11,y+11,7,5);
        ellipse(x+20,y+11,7,5);
      }
      if (current_seed.get_type() == 3){
        stroke(#07790C);
        strokeWeight(4);
        line(x+15,y+21,x+15,y+14);
        strokeWeight(7);
        line(x+17,y+16,x+12,y+13);
        noStroke();
        fill(#07790C);
        circle(x+21,y+16,7);
        circle(x+14,y+17,9);
      }
      if (current_seed.get_type() == 4){
        noStroke();
        fill(#337E36);
        rect(x+14,y+18,3,5);
        ellipse(x+10,y+15,8,7);
        stroke(#337E36);
        strokeWeight(8);
        line(x+17,y+13,x+18,y+11);
        line(x+16,y+16,x+19,y+17);
        line(x+14,y+16,x+11,y+19);
        stroke(#055508);
        strokeWeight(1);
        ellipse(x+15,y+15,6,8);
      }
      if (current_seed.get_type() == 5){
        stroke(#469349);
        strokeWeight(4);
        line(x+15,y+24,x+15,y+9);
        stroke(#0B9D11);
        line(x+19,y+11,x+22,y+14);
        line(x+11,y+17,x+8,y+15);
        line(x+18,y+11,x+21,y+7);
        strokeWeight(6);
        line(x+16,y+13,x+17,y+15);
        line(x+12,y+8,x+8,y+9);
        noStroke();
        fill(#E3F597);
        circle(x+19,y+17,5);
        circle(x+12,y+12,5);
      }
    }
    else{
      if (current_seed.get_type() == 1){
        stroke(#026C06);
        strokeWeight(6);
        line(x+15,y+23,x+15,y+7);
        stroke(#07790C);
        strokeWeight(6);
        bezier(x+15,y+20,x+17,y+15,x+20,y+19,x+21,y+21);
        bezier(x+15,y+20,x+10,y+15,x+12,y+19,x+9,y+21);        
        bezier(x+15,y+10,x+17,y+10,x+20,y+11,x+21,y+13);
        strokeWeight(4);
        line(x+14,y+9,x+11,y+13);
        stroke(#FCEA1C);
        line(x+18,y+10,x+17,y+7);
        line(x+14,y+16,x+14,y+18);
      }
      if (current_seed.get_type() == 2){
        noStroke();
        fill(#FFA5D5);
        ellipse(x+15,y+18,16,15);
        noStroke();
        stroke(#07790C);
        strokeWeight(2);
        fill(#07790C);
        ellipse(x+15,y+11,5,10);
        stroke(#048309);
        strokeWeight(6);
        line(x+19,y+11,x+20,y+12);
        line(x+11,y+11,x+10,y+12);
        fill(#07790C);
        noStroke();
        ellipse(x+11,y+8,7,5);
        ellipse(x+20,y+8,7,5);
      }
      if (current_seed.get_type() == 3){
        noStroke();
        fill(#C6B194);
        ellipse(x+15,y+20,10,8);
        stroke(#07790C);
        strokeWeight(4);
        line(x+15,y+15,x+15,y+8);
        strokeWeight(7);
        line(x+17,y+10,x+12,y+7);
        noStroke();
        fill(#07790C);
        circle(x+21,y+10,7);
        circle(x+14,y+11,9);
      }
      if (current_seed.get_type() == 4){
        stroke(#AA4C15);
        strokeWeight(1);
        fill(#C66C38);
        ellipse(x+15,y+16,20,18);
        strokeWeight(2);
        bezier(x+15,y+7,x+9,y+12,x+9,y+19,x+14,y+24);
        bezier(x+15,y+8,x+21,y+12,x+21,y+19,x+17,y+24);
        stroke(#07790C);
        strokeWeight(4);
        bezier(x+15,y+7,x+14,y+6,x+14,y+5,x+13,y+5);
      }
      if (current_seed.get_type() == 5){
        stroke(#469349);
        strokeWeight(4);
        line(x+15,y+24,x+15,y+9);
        stroke(#0B9D11);
        line(x+19,y+11,x+22,y+14);
        line(x+11,y+17,x+8,y+19);
        line(x+18,y+11,x+21,y+7);
        strokeWeight(6);
        line(x+16,y+13,x+17,y+15);
        line(x+12,y+8,x+8,y+9);
        noStroke();
        fill(#9B1313);
        circle(x+19,y+17,5);
        circle(x+12,y+12,5);
        circle(x+17,y+8,5);
        circle(x+13,y+18,5);
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
