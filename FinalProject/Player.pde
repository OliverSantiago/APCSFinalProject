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
    //Head
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
    fill(33,155,6);
    rect(x,y,20,30);
    stroke(33,155,6);
    strokeWeight(5);
    line(x,y+3,x-10,y+15);
    line(x+18,y+3,x+30,y+15);
    

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
  
  void setX(float x){
    this.x = x;
  }
  
  void setY(float y){
    this.y = y;
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
    if(inventory.size()<10){
      ArrayList<Item> temp = new ArrayList<Item>();
      temp.add(i);
      inventory.add(temp);
    }
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
  Item removeFromStack(int index){
    Item removed_item = inventory.get(index).remove(0);
    if (inventory.get(index).size()==0){
        removeStack(index);
    }
    return removed_item;
  }
  
  //Size of a stack
  int Stacksize(int index){
    return inventory.get(index).size();
  }
}
