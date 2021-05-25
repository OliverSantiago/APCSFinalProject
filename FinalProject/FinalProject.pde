Player player;
void setup(){
  size(1000,800);
  player = new Player(10,10);
}

void draw(){
  background(200);
  player.display();
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
