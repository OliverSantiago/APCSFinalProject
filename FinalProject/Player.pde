ArrayList<ArrayList<Item>> inventory = new ArrayList<ArrayList<Item>>();
public class Player{
  float x, y;
  int current_item;
  
  Player(){
    x=830;
    y=140;
    current_item = 0;
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
  
  //Changes held item
  void hold_item(int x){
    if (0<=x && x<10){
      current_item = x;
    }
  }
  
  int get_current_item(){
    return current_item;
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
