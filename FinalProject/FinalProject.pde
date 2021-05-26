Player player;
boolean first_screen = true;

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
}

void draw(){
  if(mousePressed||keyPressed){
    first_screen = false;
  }
  if(!first_screen){
    background(255,241,191);
    strokeWeight(0);
    stroke(0);
    player.display();
    fill(34,121,224);
    rect(800,100,80,50);
    
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
