Player player;
Plot [][] all_plots;
boolean first_screen = true;
boolean end_day = false;
int savedTime;

int time_increment = 500;
int time = 600;
int money = 0;
int new_money = 0;

boolean moving_item;
boolean moving_Stack;
int moving_item_index;
ArrayList<ArrayList<Item>> Sold = new ArrayList<ArrayList<Item>>();

Plot test;

void setup(){
  //Size and background
  size(1000,800);//TBD
  background(100,184,255);
  
  //Title and Controls
  textSize(32);
  fill(0, 102, 153, 204);
  text("Stardew Valley", 12, 60);
  textSize(25);
  fill(0, 102, 153, 204);
  text("Controls:", 12, 100);
  
  //Player, plots, tools, and time
  player = new Player();
  
  all_plots = new Plot[10][10];
  for(int i = 0; i < all_plots.length; i++){
    for(int j = 0; j < all_plots[i].length; j++){
      all_plots[i][j]=new Plot();
    }
  }
  
  Tool watering_can = new Tool(1);
  Tool hoe = new Tool(2);
  player.addNextItem(watering_can);
  player.addNextItem(hoe);
  
  savedTime = millis(); 
  
  //Testing seeds: To be removed
  Item seed1 = new Seed(1);
  Item seed2 = new Seed(2);
  Item seed3 = new Seed(3);
  Item seed4 = new Seed(4);
  Item seed5 = new Seed(5);
  player.addNextItem(seed1);
  player.addNextItem(seed2);
  player.addNextItem(seed3);
  player.addNextItem(seed4);
  player.addNextItem(seed5);
}

void draw(){  
  if(mousePressed||keyPressed){
    first_screen = false;
  }
    //End of Screen
  if(end_day){
    background(59,59,59);
    textSize(50);
    fill(255);
    text(money+" + "+new_money+" = " + Integer.toString(money+new_money), 12, 60);
    if(mousePressed||keyPressed){
      end_day = false;
      money+=new_money;
      new_money = 0;
      time = 600;
    }
  }else if(!first_screen){
    //Makes the background
    background(255,241,191);
    
    //Makes plots
    int x_coor = 300;
    int y_coor = 300;
    
          
    for(int i = 0; i < all_plots.length; i++){
      for(int j = 0; j < all_plots[i].length; j++){
        
        //Hitbox around plot
        if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
            dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=15){//Change if plot or player size changes!!
          all_plots[i][j].mouse_on();
        }else{
          all_plots[i][j].mouse_off();
        }
        
        //Changes state of plot if close enough and depending on held items
        if (mouseButton == LEFT&&!moving_item&&!moving_Stack){
          
          //If Player is holding Tool
          if (player.get_current_item_index() < player.size()
            &&player.get_current_item().get_Class().equals("Tool")){
            //println("works1");
            
            //If player is holding hoe, till
            if (player.get_current_item().tool_type().equals("hoe")){
              //println("works2");
              if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
                  dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=15){//Change if plot or player size changes!!
                all_plots[i][j].till();
              }
            }
            
            //If player is holding watering can, water
            if (player.get_current_item().tool_type().equals("watering_can")){
              //println("works3");
              if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
                  dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=15){//Change if plot or player size changes!!
                all_plots[i][j].water();
              }
            }
            
            //If player is holding seed, plant seed
          }else if(player.get_current_item_index() <  player.size()
                   &&player.get_current_item().get_Class().equals("Seed")){
                  if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
                      dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=15){
                    all_plots[i][j].plant(player.get_current_item());
                   }
          }
          
           //If player is holding none of above, harvest crop (if possible)
          else{
            if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
                  dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=15){
                    Item crop = all_plots[i][j].harvest();
                    for (int x = 0; x < player.size(); x++){
                      if (player.Stacksize(x)>0 && crop != null && player.get_selected_item(x).get_Class().equals("Crop") &&
                          player.get_selected_item(x).get_type() == crop.get_type() &&
                          player.get_selected_item(x).getQuality().equals(crop.getQuality())){
                            player.addToStack(x,crop);
                       }else if(x == player.size()-1 && crop != null){
                         player.addNextItem(crop);
                       }
                    }
                  }
          }
        }
        all_plots[i][j].display(x_coor,y_coor);
        y_coor += 30;
        
      }
      x_coor+=30;
      y_coor = 300;
    }
    
    //Makes the player
    strokeWeight(0);
    stroke(0);
    player.display();
    
    //Makes the house and bin
    fill(34,121,224);
    rect(800,100,80,50);
    
    fill(232,211,108);
    rect(725,125,30,15);
    
    //Makes the inventory
    stroke(0);
    strokeWeight(4);
    stroke(0);
    noFill();
    rect(250, 700, 50,50);
    rect(300, 700, 50,50);
    rect(350, 700, 50,50);
    rect(400, 700, 50,50);
    rect(450, 700, 50,50);
    rect(500, 700, 50,50);
    rect(550, 700, 50,50);
    rect(600, 700, 50,50);
    rect(650, 700, 50,50);
    rect(700, 700, 50,50);
    int counter = 263;
    for (int i = 0; i < player.size(); i++){ 
      player.get_selected_item(i).display(counter,710);
      //text(player.Stacksize(i),counter-10,700);
      //This is where we will show the image of each item in inventory at x index of counter
      counter+=50;
    }
    if (player.get_current_item_index()==0){
      noStroke();
      fill(216, 252, 110,150);
      rect(250,700,50,50);
    }
    if (player.get_current_item_index()==1){
      noStroke();
      fill(216, 252, 110,150);
      rect(300, 700, 50,50);
    }
    if (player.get_current_item_index()==2){
      noStroke();
      fill(216, 252, 110,150);
      rect(350, 700, 50,50);
    }
    if (player.get_current_item_index()==3){
      noStroke();
      fill(216, 252, 110,150);
      rect(400, 700, 50,50);
    }
    if (player.get_current_item_index()==4){
      noStroke();
      fill(216, 252, 110,150);
      rect(450, 700, 50,50);
    }
    if (player.get_current_item_index()==5){
      noStroke();
      fill(216, 252, 110,150);
      rect(500, 700, 50,50);
    }
    if (player.get_current_item_index()==6){
      noStroke();
      fill(216, 252, 110,150);
      rect(550, 700, 50,50);
    }
    if (player.get_current_item_index()==7){
      noStroke();
      fill(216, 252, 110,150);
      rect(600, 700, 50,50);
    }
    if (player.get_current_item_index()==8){
      noStroke();
      fill(216, 252, 110,150);
      rect(650, 700, 50,50);
    }if (player.get_current_item_index()==9){
      noStroke();
      fill(216, 252, 110,150);
      rect(700, 700, 50,50);
    }
    
    //Putting items in the bin
    if(mouseButton == LEFT){
      if (dist((float)mouseX,(float)mouseY,375,725)<=25){
        moving_item = true;
        moving_item_index = 2;
      }else if (dist((float)mouseX,(float)mouseY,425,725)<=25){
        moving_item = true;
        moving_item_index = 3;
      }else if (dist((float)mouseX,(float)mouseY,475,725)<=25){
        moving_item = true;
        moving_item_index = 4;
      }else if (dist((float)mouseX,(float)mouseY,525,725)<=25){
        moving_item = true;
        moving_item_index = 5;
      }else if (dist((float)mouseX,(float)mouseY,575,725)<=25){
        moving_item = true;
        moving_item_index = 6;
      }else if (dist((float)mouseX,(float)mouseY,625,725)<=25){
        moving_item = true;
        moving_item_index = 7;
      }else if (dist((float)mouseX,(float)mouseY,675,725)<=25){
        moving_item = true;
        moving_item_index = 8;
      }else if (dist((float)mouseX,(float)mouseY,725,725)<=25){
        moving_item = true;
        moving_item_index = 9;
      }
    }
    if(moving_item_index>=player.size()){
      moving_item = false;
    }
    if(moving_item){
      player.get_selected_item(moving_item_index).display(mouseX,mouseY);
    }
    if(moving_item&&mouseButton==LEFT){
      if (dist((float)mouseX,(float)mouseY,740,132)<15){
        sell(player.get_selected_item(moving_item_index));
        player.removeFromStack(moving_item_index);
        moving_item = false;
      }
     }
    
    if(mouseButton == RIGHT){
      if (dist((float)mouseX,(float)mouseY,375,725)<=25){
        moving_Stack = true;
        moving_item_index = 2;
      }else if (dist((float)mouseX,(float)mouseY,425,725)<=25){
        moving_Stack = true;
        moving_item_index = 3;
      }else if (dist((float)mouseX,(float)mouseY,475,725)<=25){
        moving_Stack = true;
        moving_item_index = 4;
      }else if (dist((float)mouseX,(float)mouseY,525,725)<=25){
        moving_Stack = true;
        moving_item_index = 5;
      }else if (dist((float)mouseX,(float)mouseY,575,725)<=25){
        moving_Stack = true;
        moving_item_index = 6;
      }else if (dist((float)mouseX,(float)mouseY,625,725)<=25){
        moving_Stack = true;
        moving_item_index = 7;
      }else if (dist((float)mouseX,(float)mouseY,675,725)<=25){
        moving_Stack = true;
        moving_item_index = 8;
      }else if (dist((float)mouseX,(float)mouseY,725,725)<=25){
        moving_Stack = true;
        moving_item_index = 9;
      }
    }
    if(moving_item_index>=player.size()){
      moving_Stack = false;
    }
    if(moving_Stack){
      player.get_selected_item(moving_item_index).display(mouseX,mouseY);
    }
    if(moving_Stack&&mouseButton==LEFT){
      if (dist((float)mouseX,(float)mouseY,740,1532)<15){
        sell(player.get_selected_item(moving_item_index));
        player.removeFromStack(moving_item_index);
        moving_Stack = false;
      }
    }
    
    //Displays money and time
    int passedTime = millis() - savedTime;
    if(passedTime > time_increment){
      time += 10;
      if (time % 100 >= 60){
        time += 40;
      }
      savedTime = millis();
    }
    textSize(20);
    fill(0, 102, 153, 204);
    text("Time: " + time/100+ ":" + time%100/10 + "0", 10, 30);
    textSize(20);
    fill(0, 102, 153, 204);
    text("Money: "+money, 10, 60);
    
    //Puts "filter" based on time, will change so colors make more sense, currently just changes after time reaches 1200;
    if (time>=1200 && time<=2400){
      noStroke();
      fill(34,126,237,100);
      rect(0,0,width,height);
    }if(time>=2400){
       end_of_day_calculate();
       end_day = true;
    }
  }
}

void keyPressed(){
  //println(keyCode);
  //Movement Controls
  if(keyCode == 87){
    player.Up();
  }
  if(keyCode == 83){
    player.Down();
  }
  if(keyCode == 65){
    player.Left();
  }
  if(keyCode == 68){
    player.Right();
  }
  
  //Item Select
  if(keyCode == 49){
    player.hold_item(0);
  }
  if(keyCode == 50){
    player.hold_item(1);
  }
  if(keyCode == 51){
    player.hold_item(2);
  }
  if(keyCode == 52){
    player.hold_item(3);
  }
  if(keyCode == 53){
    player.hold_item(4);
  }
  if(keyCode == 54){
    player.hold_item(5);
  }
  if(keyCode == 55){
    player.hold_item(6);
  }
  if(keyCode == 56){
    player.hold_item(7);
  }
  if(keyCode == 57){
    player.hold_item(8);
  }
  if(keyCode == 48){
    player.hold_item(9);
  } 
  
  //Stop holding item
  if(keyCode==81){
    moving_item=false;
    moving_Stack=false;
  }
}

//Selling items
void sell(ArrayList<Item> sold_item){
  Sold.add(sold_item);
}

void sell(Item sold_item){
  boolean added = false;
  for(int i = 0; i < Sold.size(); i++){
    if (Sold.get(i).get(0).getClass().equals(sold_item.getClass())&&      
        Sold.get(i).get(0).get_type()==sold_item.get_type()){
        
      Sold.get(i).add(sold_item);
      added = true;
      break;
    }
  }
  if (!added){
    ArrayList<Item> temp = new ArrayList<Item>();
    temp.add(sold_item);
    Sold.add(temp);
  }
}

void end_of_day_calculate(){
  for(int i = 0; i < Sold.size(); i++){
    new_money+=Sold.get(i).get(0).getPrice() * Sold.get(i).size();
  }
  while(Sold.size()>0){
    Sold.remove(0);
  }
  
  for(int i = 0; i < all_plots.length; i++){
    for(int j = 0; j < all_plots[0].length;j++){
      all_plots[i][j].end_of_day();
    }
  }
}
