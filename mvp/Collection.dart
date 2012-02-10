class Coll<T> extends EventBus implements Storeable{
  Set _set;
  Store store;
  String uri;
  bool _isNew;
  
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
  
  save(){
    if(store != null){
      Function method =  ( _isNew  ?  store.create : store.update);
      _isNew = false;
      print(toStore());
      method(this, ()=>print('saved'));
    }
  }
  
  String toStore(){
    String s = '[';
    bool first=true;
    
    _set.forEach(function(item){
      if (first) {
        first = false;
      } else {
        s+=',';
      }
      s += item.toStore();
    });
    s +=']';
    print(s);
    return s;
  }
  
  
  
}
