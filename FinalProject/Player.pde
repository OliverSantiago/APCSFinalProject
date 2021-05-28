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
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  //Changes held item
  void hold_item(int x){
    if (0<=x && x<10){
      current_item = x;
    }
  }
  
  //Use current item
  
  //Return current item index
  int get_current_item_index(){
    return current_item;
  }
  
  //Return current item
  Item get_current_item(){
     return inventory.get(current_item).get(0);
  }

  //Get selected item
  Item get_selected_item(int x){
    return inventory.get(x).get(0);
  }
  
  //Add new item at next available slot
  void addNextItem(Item i){
    ArrayList<Item> temp = new ArrayList<Item>();
    temp.add(i);
    inventory.add(temp);
  }
  
  //Remove slot
  void removeStack(int i){
    inventory.remove(i);
  }
  
  //Size of inventory
  int size(){
    return inventory.size();
  }
  
  //Add to an existing stack of items 
  void addToStack(int index, Item i){
    inventory.get(index).add(i);
  }
  
  //Remove from existing stack of items
  void removeFromStack(int index){
    inventory.get(index).remove(0);
    if (inventory.get(index).size()==0){
        removeStack(index);
    }
  }
  
  //Size of a stack
  int Stacksize(int index){
    return inventory.get(index).size();
  }
}
