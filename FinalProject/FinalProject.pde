Player player;
Plot [][] all_plots;
boolean first_screen = true;
boolean end_day = false;
int savedTime;

boolean town = false;
boolean can_move_back = true;
boolean set_x_coor = true;

boolean buy_screen = false;
boolean buy_screen_opened = false;
boolean can_press = true;

boolean inside = true;
boolean new_day = true;
boolean ask_to_sleep = false;
boolean has_left_bed = false;

int time_increment = 1000;
int time = 600;
int money = 0;
int new_money = 0;

boolean moving_item;
boolean moving_Stack;
int moving_item_index;
ArrayList<ArrayList<Item>> Sold = new ArrayList<ArrayList<Item>>();

//Seeds for shop, do not remove
Item shop_corn = new Seed(1);
Item shop_melon = new Seed(2);
Item shop_potato = new Seed(3);
Item shop_pumpkin = new Seed(4);
Item shop_tomato = new Seed(5);

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
  text("Controls: WASD to move, Right-click to use.", 12, 100);
  
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
  //Item seed1 = new Seed(1);
  //Item seed2 = new Seed(2);
  //Item seed3 = new Seed(3);
  //Item seed4 = new Seed(4);
  //Item seed5 = new Seed(5);
  //player.addNextItem(seed1);
  //player.addNextItem(seed2);
  //player.addNextItem(seed3);
  //player.addNextItem(seed4);
  //player.addNextItem(seed5);
  
  //Starting seeds
  Item seed1 = new Seed(1);
  Item seed2 = new Seed(1);
  Item seed3 = new Seed(1);
  Item seed4 = new Seed(1);
  Item seed5 = new Seed(1);
  player.addNextItem(seed1);
  player.addToStack(2,seed2);
  player.addToStack(2,seed3);
  player.addToStack(2,seed4);
  player.addToStack(2,seed5);
  
  //Starting money
  money += 500;
}

void draw(){  
  if(mousePressed||keyPressed){
    first_screen = false;
  }
    //End of Screen
  if(!first_screen){
    if(end_day){
      background(196,234,99);
      textSize(50);
      fill(255);
      text(money+" + "+new_money+" = " + Integer.toString(money+new_money), 12, 60);
      if(mousePressed||keyPressed){
        end_day = false;
        money+=new_money;
        new_money = 0;
        time = 600;
      }
    }else{
      if(inside){
        background(0);
                
        //Make house
        
        //Floor
        noStroke();
        fill(206,164,79);
        rect(300,330,400,200);
        
        //Wall
        fill(79,133,206);
        rect(300,230,400,100);
        
        //Border
        stroke(245,209,77);
        strokeWeight(10);
        noFill();
        rect(300,230,400,300);
        
        //Door
        stroke(0);
        fill(0);
        rect(330,530,50,30);
        
        //Top of Bed
        noStroke();
        fill(95,57,43);
        rect(645,320,50,30);
        
        //Player
        if(new_day){
          player.setX(650.0);
          player.setY(330.0);
          new_day = false;
        }
        strokeWeight(0);
        player.display();
        
        //Bed
        noStroke();
        fill(255,10,14);
        rect(645,340,50,50);
        
        
        //Sleep
        if(!(645<player.getX()&&player.getX()<695&&320<player.getY()&&player.getY()<400)){
          has_left_bed = true;
          ask_to_sleep = false;
        }
        
        if(645<player.getX()&&player.getX()<695&&320<player.getY()&&player.getY()<400&&has_left_bed){
          ask_to_sleep = true;
        }
        
        if(ask_to_sleep){
          stroke(255,166,0);
          strokeWeight(5);
          fill(255,207,116);
          rect(200,75,600,100);
          strokeWeight(0);
          
          textSize(50);
          fill(0);
          text("Sleep?", 250, 145);
          
          textSize(30);
          fill(255,166,0);
          rect(500,105,80,50);
          fill(100);
          text("Yes", 515, 140);
          
          fill(255,166,0);
          rect(650,105,80,50);
          fill(100);
          text("No", 670, 140);
          
          
          if(mouseButton == LEFT && 500<mouseX&&mouseX<580&&105<mouseY&&mouseY<155&&can_press){
            can_press = false;
            end_of_day_calculate();
            ask_to_sleep = false;
          }
          
          if(mouseButton == LEFT && 650<mouseX&&mouseX<730&&105<mouseY&&mouseY<155){
            ask_to_sleep = false;
            has_left_bed = false;
          }
          
        }
        
        if(time>=2400){
           end_of_day_calculate();
        }
        
      }else{
        if(town){//Screen for Town
        
          background(124,227,124);
          
         
          //Shop keeper 
          //Head
          float x = 241;
          float y = 140;
          noStroke();
          fill(255,238,139);
          circle(x+10,y-5,20);
          
          //Pants
          stroke(52,59,255);
          strokeWeight(10);
          line(x+5,y+30,x+1,y+43);
          line(x+15,y+30,x+17,y+43);
          
          //Shirt
          noStroke();
          //fill(0,203,103);
          fill(255,0,0);
          rect(x,y,20,30);
          stroke(255,0,0);
          strokeWeight(5);
          line(x,y+3,x-10,y+15);
          line(x+18,y+3,x+30,y+15);
          
          //Makes shop
          noStroke();
          //fill(227,207,30);
          //rect(500,100,50,60);
          //fill(196,234,99);
          //rect(505,115,40,20);
          fill(227,207,30);
          rect(188,121,10,80);
          rect(304,121,10,80);
          fill(234,145,0);
          triangle(188,121,314,121,251,80);
          fill(255,255,0);
          rect(188,180,126,20);
          
          //Movement Between Screens
          if(!set_x_coor){
            player.setX(1);
            set_x_coor = true;
          }
          strokeWeight(0);
          stroke(0);
          player.display();
          if(player.getX()>=20){
            can_move_back = true;
          }
          if(player.getX()<=10&&can_move_back){
            town = false;
            set_x_coor = false;
            can_move_back = false;
          }
          
          //Tree Border
          noStroke();
          fill(102,191,90);
          circle(1000-990,40,100);
          circle(1000-930,40,100);
          circle(1000-870,35,100);
          circle(1000-820,10,100);
          circle(1000-760,5,90);
          circle(1000-690,0,100);
          circle(1000-620,2,80);
          circle(1000-570,2,90);
          circle(1000-490,2,100);
          circle(1000-410,10,100);
          circle(1000-345,10,70);
          circle(1000-290,10,100);
          circle(1000-220,20,90);
          circle(1000-150,25,100);
          circle(1000-100,60,90);
          circle(1000-50,120,100);
          circle(1000-30,180,80);
          circle(1000-25,240,90);
          circle(1000-23,290,60);
          circle(1000-15,350,90);
          circle(1000-10,420,90);
          circle(1000-10,480,80);
          circle(1000-5,540,90);
          circle(1000-7,610,90);
          circle(1000-5,670,80);
          circle(1000-20,720,90);
          circle(1000-25,780,100);
          circle(1000-80,805,90);
          circle(1000-140,815,90);
          circle(1000-200,815,80);
          circle(1000-255,818,90);
          circle(1000-320,820,80);
          circle(1000-370,825,80);
          circle(1000-420,825,90);
          circle(1000-480,820,80);
          circle(1000-540,820,90);
          circle(1000-600,825,90);
          circle(1000-670,820,90);
          circle(1000-730,810,70);
          circle(1000-790,820,90);
          circle(1000-850,810,90);
          circle(1000-920,810,90);
          circle(1000-990,800,90);
          circle(1000-0,0,250);
          circle(1000-0,155,100);
          
          
          //Buying items
          if(mouseButton == LEFT && dist(241,140, player.getX(), player.getY())<= 120 && dist(mouseX,mouseY,241,140)<=100){
            buy_screen = true; 
          }
          
          if(buy_screen){
            
            
            if(!buy_screen_opened){
              can_press = false;
              buy_screen_opened = true;
            }
            
            if(dist(241,140, player.getX(),  player.getY())>120 || (mousePressed && dist(mouseX,mouseY,150.0,100.0)<=100)){
              buy_screen = false;
              buy_screen_opened = false;
            }
            
            //Main Box
            strokeWeight(10);
            stroke(0);
            fill(255,207,116);
            rect(150,100,700,500);
            
            //X out box
            strokeWeight(5);
            stroke(0);
            fill(216,216,216);
            rect(130,80,50,50);
            
            //Displayed items to be purchased
            strokeWeight(3);
            stroke(0);
            line(150,200,850,200);
            shop_corn.display(200,135);
            textSize(50);
            fill(0);
            text("Corn: "+ shop_corn.getPrice() + "0 coins", 260, 170);
        
            strokeWeight(3);
            stroke(0);
            line(150,300,850,300);
            shop_melon.display(200,235);
            textSize(50);
            fill(0);
            text("Melon: "+ shop_melon.getPrice() + "0 coins", 260, 270);
            
            strokeWeight(3);
            stroke(0);
            line(150,400,850,400);
            shop_potato.display(200,335);
            textSize(50);
            fill(0);
            text("Potato: "+ shop_potato.getPrice() + "0 coins", 260, 370);
            
            strokeWeight(3);
            stroke(0);
            line(150,500,850,500);
            shop_pumpkin.display(200,435);
            textSize(50);
            fill(0);
            text("Pumpkin: "+ shop_pumpkin.getPrice() + "0 coins", 260, 470);
            
            shop_tomato.display(200,535);
            textSize(50);
            fill(0);
            text("Tomato: "+ shop_tomato.getPrice() + "0 coins", 260, 570);
            strokeWeight(0);
            
            //Purchasing items
            if(mousePressed && can_press && (150<=mouseX && mouseX <= 850 && 100<mouseY && mouseY<=200) && money >= shop_corn.getPrice()){
              can_press = false;
              boolean added = false;
              Item corn = new Seed(1.0);
              for(int i = 0; i < player.size(); i++){
                if (player.get_selected_item(i).get_Class().equals("Seed")&&player.get_selected_item(i).get_type()==1){
                  player.addToStack(i,corn);
                  added = true;
                  break;
                }
              }
              if (!added){
                player.addNextItem(corn);
              }
              money -= corn.getPrice();
            }
            
            if(mousePressed &&  can_press && (150<=mouseX && mouseX <= 850 && 200<mouseY && mouseY<=300) && money >= shop_melon.getPrice()){
              can_press = false;
              boolean added = false;
              Item melon = new Seed(2.0);
              for(int i = 0; i < player.size(); i++){
                if (player.get_selected_item(i).get_Class().equals("Seed")&&player.get_selected_item(i).get_type()==2){
                  player.addToStack(i,melon);
                  added = true;
                  break;
                }
              }
              if (!added){
                player.addNextItem(melon);
              }
              money -= melon.getPrice();
            }
            
            if(mousePressed &&  can_press && (150<=mouseX && mouseX <= 850 && 300<mouseY && mouseY<=400) && money >= shop_potato.getPrice()){
              can_press = false;
              boolean added = false;
              Item potato = new Seed(3.0);
              for(int i = 0; i < player.size(); i++){
                if (player.get_selected_item(i).get_Class().equals("Seed")&&player.get_selected_item(i).get_type()==3){
                  player.addToStack(i,potato);
                  added = true;
                  break;
                }
              }
              if (!added){
                player.addNextItem(potato);
              }
              money -= potato.getPrice();
            }
            
            if(mousePressed &&  can_press && (150<=mouseX && mouseX <= 850 && 400<mouseY && mouseY<=500) && money >= shop_pumpkin.getPrice()){
              can_press = false;
              boolean added = false;
              Item pumpkin = new Seed(4.0);
              for(int i = 0; i < player.size(); i++){
                if (player.get_selected_item(i).get_Class().equals("Seed")&&player.get_selected_item(i).get_type()==4){
                  player.addToStack(i,pumpkin);
                  added = true;
                  break;
                }
              }
              if (!added){
                player.addNextItem(pumpkin);
              }
              money -= pumpkin.getPrice();
            }
            
            if(mousePressed &&  can_press && (150<=mouseX && mouseX <= 850 && 500<mouseY && mouseY<=600) && money >= shop_tomato.getPrice()){
              can_press = false;
              boolean added = false;
              Item tomato = new Seed(5.0);
              for(int i = 0; i < player.size(); i++){
                if (player.get_selected_item(i).get_Class().equals("Seed")&&player.get_selected_item(i).get_type()==5){
                  player.addToStack(i,tomato);
                  added = true;
                  break;
                }
              }
              if (!added){
                player.addNextItem(tomato);
              }
              money -= tomato.getPrice();
            }
          }
              
        }else{//Screen for Farm
        
          //Makes the background
          background(255,241,191);
          
          //Makes plots
          int x_coor = 300;
          int y_coor = 300;
          
          for(int i = 0; i < all_plots.length; i++){
            for(int j = 0; j < all_plots[i].length; j++){
              
              //Hitbox around plot
              if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
                  dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=25){//Change if plot or player size changes!!
                all_plots[i][j].mouse_on();
              }else{
                all_plots[i][j].mouse_off();
              }
              
              
              all_plots[i][j].display(x_coor,y_coor);
              y_coor += 30;
              
            }
            x_coor+=30;
            y_coor = 300;
          }
                              
          //Makes the house and bin
          fill(255,159,13);
          rect(780,80,100,100);
          fill(0);
          rect(810,130,40,50);
          fill(234,59,0);
          triangle(760,90,830,60,900,90);
          
          fill(232,211,108);
          rect(715,150,60,30);
          
   
          
          //Makes the player
          strokeWeight(0);
          stroke(0);
          if(!set_x_coor){
            player.setX(990);
            set_x_coor = true;
          }
          player.display();
          
          //Checks if close to edge
          if(player.getX()>=990&&can_move_back){
            town = true;
            set_x_coor = false;
            can_move_back = false;
          }
          
          if(player.getX()<=980){
            can_move_back = true;
          }

          
          //Tree Border
          noStroke();
          fill(102,191,90);
          circle(990,-1,100);
          circle(930,5,80);
          circle(870,2,90);
          circle(820,-3,100);
          circle(760,-10,90);
          circle(690,0,100);
          circle(620,2,80);
          circle(570,2,90);
          circle(490,2,100);
          circle(410,10,100);
          circle(345,10,70);
          circle(290,10,100);
          circle(220,20,90);
          circle(150,25,100);
          circle(100,50,90);
          circle(30,120,100);
          circle(30,180,80);
          circle(25,240,90);
          circle(23,290,60);
          circle(15,350,90);
          circle(10,420,90);
          circle(10,480,80);
          circle(5,540,90);
          circle(7,610,90);
          circle(5,670,80);
          circle(20,720,90);
          circle(25,780,100);
          circle(80,805,90);
          circle(140,815,90);
          circle(200,815,80);
          circle(255,818,90);
          circle(320,820,80);
          circle(370,825,80);
          circle(420,825,90);
          circle(480,820,80);
          circle(540,820,90);
          circle(600,825,90);
          circle(670,820,90);
          circle(730,810,70);
          circle(790,820,90);
          circle(850,810,90);
          circle(920,810,90);
          circle(990,800,90);
          circle(0,0,250);
          circle(0,155,100);
          
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
            if (dist((float)mouseX,(float)mouseY,745,165)<30){
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
            if (dist((float)mouseX,(float)mouseY,745,165)<30){
              sell(player.get_selected_item(moving_item_index));
              player.removeStack(moving_item_index);
              moving_Stack = false;
            }
          }
  
        }
              
      //Puts "filter" based on time, will change so colors make more sense, currently just changes after time reaches 1200;
        if (time>=1200 && time<=2400){
          noStroke();
          fill(34,126,237,100);
          rect(0,0,width,height);
        }if(time>=2400){
           end_of_day_calculate();
        }
      }
      //Code for inventory/time/money, etc
      strokeWeight(4);
      stroke(245,209,77);
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
      int counter = 260;
      for (int i = 0; i < player.size(); i++){ 
        player.get_selected_item(i).display(counter,710);
        //This is where we will show the image of each item in inventory at x index of counter
             if (!player.get_selected_item(i).get_Class().equals("Tool")){
          textSize(18);
          fill(150);
          if(player.Stacksize(i)<10){
            text(Integer.toString(player.Stacksize(i)), counter+25, 745);
          }else if(player.Stacksize(i)<100){
            text(Integer.toString(player.Stacksize(i)), counter+16, 745);
          }else{
            text(Integer.toString(player.Stacksize(i)), counter+7, 745);
          }
        }
        
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
    }
  }
}

void mousePressed(){
  //println(mouseX);
  //println(mouseY);
  int x_coor = 300;
  int y_coor = 300;
  
  for (int i = 0; i < all_plots.length; i++){
    for (int j = 0; j < all_plots[0].length; j++){
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
                  dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=25){//Change if plot or player size changes!!
                all_plots[i][j].till();
              }
            }
            
            //If player is holding watering can, water
            if (player.get_current_item().tool_type().equals("watering_can")){
              //println("works3");
              if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
                  dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=25){//Change if plot or player size changes!!
                all_plots[i][j].water();
              }
            }
            
            //If player is holding seed, plant seed
          }else if(player.get_current_item_index() <  player.size()
                   &&player.get_current_item().get_Class().equals("Seed")){
                  if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
                      dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=25){
                        if (all_plots[i][j].plant(player.get_current_item())){
                          player.removeFromStack(player.get_current_item_index());
                        }
                   }
          }
          
           //If player is holding none of above, harvest crop (if possible)
          else{
            if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
                  dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=25){
                    Item crop = all_plots[i][j].harvest();
                    boolean existing_stack = false;
                    for (int x = 0; x < player.size(); x++){
                      if (player.Stacksize(x)>0 && crop != null && player.get_selected_item(x).get_Class().equals("Crop") &&
                          player.get_selected_item(x).get_type() == crop.get_type() 
                          &&player.get_selected_item(x).getQuality().equals(crop.getQuality())
                          ){
                            player.addToStack(x,crop);
                            existing_stack = true;
                          }
                       }
                       if (crop != null && !existing_stack){
                         player.addNextItem(crop);
                    }
                  }
          }
        }
        y_coor += 30;
    }
    x_coor += 30;
    y_coor = 300;
  }
}

void keyPressed(){
  //println(keyCode);
  //Movement Controls
  if(keyCode == 87){
    if(inside){
      if(player.getY()-10>=300&&(!(640<player.getX()&&player.getX()<690&&player.getY()-10<400))){
        player.Up();
      }
    }else if(town){
      
      if(!(188<player.getX()&&player.getX()<304&&100<player.getY()&&player.getY()-10<160)
      && !(player.getY()-10<30)){
        player.Up();
      }
            
    }else{
      
      if(820<=player.getX()&&player.getX()<=845&&player.getY()-10<=160){
        inside = true;
        player.setX(340);
        player.setY(470);
      }
      
      if(!(710<player.getX()&&player.getX()<820&&player.getY()-10<160)
      &&!(845<player.getX()&&player.getX()<880&&player.getY()-10<160)
      &&!(player.getY()-10<30)){
        player.Up();
      }
      
    }
  }
  
  if(keyCode == 83){
    if(inside){
      if(330<=player.getX()&&player.getX()<=380&&player.getY()+40>=520){
        inside = false;
        player.setX(821);
        player.setY(135);
      }
      
      if((!(player.getX()>=640 && player.getY()<=390))&&player.getY()+10<=480){
        player.Down();
      }
    }else if(town){
      
      if(!(188<player.getX()&&player.getX()<304&&player.getY()<100&&player.getY()+10>30)
      && !(player.getY()+10>740)){
        player.Down();
      }
      
    }else{
      
      if(!(player.getY()+10>740)){
        player.Down();
      }
    }
  }
  
  if(keyCode == 65){
    if(inside){
      if(player.getX()-10>=310){
        player.Left();
      }
    }else if(town){
      
      if(!(30<player.getY()&&player.getY()<160&&player.getX()-10<315&&player.getX()>300)
      && !(player.getX()-10<0)){
        player.Left();
      }
      
    }else{
      
    if(!(30<player.getY()&&player.getY()<160&&player.getX()-10<900&&780<player.getX())
    && !(player.getX()-10<50)){
        player.Left();
      }
    }
  }
  
  if(keyCode == 68){
    if(inside){
      if(player.getX()+10<=665){
        player.Right();
      }
    }else if(town){
      
      if(!(30<player.getY()&&player.getY()<160&&player.getX()+10>170&&player.getX()<310)
      &&!(player.getX()+10>1000-50)){
        player.Right();
      }
      
      
    }else{
      
      if(!(player.getX()+10>700&&player.getX()<730&&player.getY()<140)
      && !(player.getX()+10>1000)){
        player.Right();
      }
    }
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

void mouseReleased(){
  can_press = true;
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
       if(moving_Stack){
         for(int j = 0; j < player.Stacksize(moving_item_index); j++){
           Sold.get(i).add(sold_item);           
         }
       }
      added = true;
      break;
    }
  }
  if (!added){
    if(moving_Stack){
      ArrayList<Item> temp = new ArrayList<Item>();
      for(int j = 0; j < player.Stacksize(moving_item_index); j++){
        temp.add(sold_item);           
      }
      Sold.add(temp);
    }else{
      ArrayList<Item> temp = new ArrayList<Item>();
      temp.add(sold_item);
      Sold.add(temp);
    }
  }
}

void end_of_day_calculate(){
  end_day = true;
  new_day = true;
  inside = true;
  town = false;
  has_left_bed = false;
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
  delay(500);
}
