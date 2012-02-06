class Coll<T> extends EventBus{
  Set<T> _set;
  
  Coll(){
    _set = new HashSet();
  }
  
  void add(T value){
    _set.add(value);
    trigger('add', value);
  }
  
  void remove(T value){
    _set.remove(value);
    trigger('remove', value);
  }
}
