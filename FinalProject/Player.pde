ArrayList<ArrayList<Item>> inventory = new ArrayList<ArrayList<Item>>();
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
  
  void addNextItem(Item i){
    ArrayList<Item> temp = new ArrayList<Item>();
    temp.add(i);
    inventory.add(temp);
  }
  
  void removeItem(Item i){
    inventory.remove(i);
  }
  
  int size(){
    return inventory.size();
  }
  
  void addToStack(int index, Item i){
    inventory.get(index).add(i);
  }
  
  void removeFromStack(int index, Item i){
    inventory.get(index).remove(i);
  }
  
  int Stacksize(int index){
    return inventory.get(index).size();
  }
}
