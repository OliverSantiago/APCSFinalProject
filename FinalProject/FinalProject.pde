Player player;
boolean first_screen = true;
int savedTime;
int time_increment = 5000;
int time = 600;
int money = 0;

void setup(){
  size(1000,800);//TBD
  background(100,184,255);
  textSize(32);
  fill(0, 102, 153, 204);
  text("Stardew Valley", 12, 60);
  textSize(25);
  fill(0, 102, 153, 204);
  text("Controls:", 12, 100);
  player = new Player();
  savedTime = millis();
}

void draw(){
  if(mousePressed||keyPressed){
    first_screen = false;
  }
  if(!first_screen){
    //Makes the background
    background(255,241,191);
    
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
    
  }
}

void keyPressed(){
  //println(keyCode);
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
  
}
