Player player;
Plot [][] all_plots;
boolean first_screen = true;
int savedTime;
int time_increment = 1000;
int time = 600;
int money = 0;
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
  
  Tool watering_can = new Tool();
  watering_can.set_watering_can();
  Tool hoe = new Tool();
  hoe.set_hoe();
  player.addNextItem(watering_can);
  player.addNextItem(hoe);
  
  savedTime = millis(); 
  
  
}

void draw(){
  if(mousePressed||keyPressed){
    first_screen = false;
  }
  if(!first_screen){
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
        if (mouseButton == 37){
          if (dist((float)mouseX,(float)mouseY,x_coor+15,y_coor+15)<=15&&
              dist(player.getX()+5,player.getY()+10,x_coor+15,y_coor+15)<=15){//Change if plot or player size changes!!
            all_plots[i][j].till();
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
    
    //Makes the house
    fill(34,121,224);
    rect(800,100,80,50);
    
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
    int counter = 275;
    for (int i = 0; i < player.size(); i++){
      //This is where we will show the image of each item in inventory at x index of counter
      counter+=100;
    }
    if (player.get_current_item()==0){
      noStroke();
      fill(216, 252, 110,150);
      rect(250,700,50,50);
    }
    if (player.get_current_item()==1){
      noStroke();
      fill(216, 252, 110,150);
      rect(300, 700, 50,50);
    }
    if (player.get_current_item()==2){
      noStroke();
      fill(216, 252, 110,150);
      rect(350, 700, 50,50);
    }
    if (player.get_current_item()==3){
      noStroke();
      fill(216, 252, 110,150);
      rect(400, 700, 50,50);
    }
    if (player.get_current_item()==4){
      noStroke();
      fill(216, 252, 110,150);
      rect(450, 700, 50,50);
    }
    if (player.get_current_item()==5){
      noStroke();
      fill(216, 252, 110,150);
      rect(500, 700, 50,50);
    }
    if (player.get_current_item()==6){
      noStroke();
      fill(216, 252, 110,150);
      rect(550, 700, 50,50);
    }
    if (player.get_current_item()==7){
      noStroke();
      fill(216, 252, 110,150);
      rect(600, 700, 50,50);
    }
    if (player.get_current_item()==8){
      noStroke();
      fill(216, 252, 110,150);
      rect(650, 700, 50,50);
    }if (player.get_current_item()==9){
      noStroke();
      fill(216, 252, 110,150);
      rect(700, 700, 50,50);
    }
    
    //Displays money and time
    int passedTime = millis() - savedTime;
    if(passedTime > time_increment){
      time += 10;
      savedTime = millis();
    }
    textSize(20);
    fill(0, 102, 153, 204);
    text("Time: " + time, 10, 30);
    textSize(20);
    fill(0, 102, 153, 204);
    text("Money: "+money, 10, 60);
    
    //Puts "filter" based on time, will change so colors make more sense, currently just changes after time reaches 1200;
     if (time>1200){
      noStroke();
      fill(34,126,237,100);
      rect(0,0,width,height);
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
  
}
