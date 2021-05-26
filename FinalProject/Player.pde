ArrayList<Item> inventory;
public class Player{
  float x, y;
  
  Player(){
    x=830;
    y=140;
  }
 
  void display(){
    stroke(0);
    fill(0,203,103);
    rect(x,y,10,20);
  }
  
  void Up(){
    y-=10;
  }
  
  void Down(){
    y+=10;
  }
  
  void Left(){
    x-=10;
  }
  
  void Right(){
    x+=10;
  }
  
  void add(Item i){
    inventory.add(i);
  }
  
  void remove(Item i){
    inventory.remove(i);
  }
}
