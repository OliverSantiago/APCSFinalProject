public class Item{
  float price = 0;
  
  public Item(){ 
  }
  
  public Item(float p){
    price = p;
  }
  //Need to add classes of subclasses to compile//
  
  void display(int x, int y){
  }
  
  String get_Class(){
    return "blah";
  }
  
  String tool_type(){
    return "bluh";
  }
  
  String getQuality(){
    return "bloh";
  }
  
  void setQuality(int x){
    
  }
  
  int get_type(){
    return -1;
  }
  
  public float getPrice(){
    return price;
  }
}
