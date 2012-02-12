class Coll<T> extends EventBus implements Storeable{
  Set _set;
  Store store;
  String uri;
  bool _isNew;
  
  Coll(){
    _set = new HashSet();
  }
  
  /**
   * add a new item to the collection, fires an "add" event
   **/
  void add(T value){
    _set.add(value);
    trigger('add', value);
  }
  
  /**
   * delete the passed item to the collection, fires an "remove" event
   **/
  void remove(T value){
    _set.remove(value);
    trigger('remove', value);
  }
  
  /**
   * save the collection to the store of the store of the collection, fires an "saved" event
   **/
  save(){
    if(store != null){
      Function method =  ( _isNew  ?  store.create : store.update);
      _isNew = false;
      method(this, ()=>trigger('saved'));
    }
  }
  
  /**
   * Fetch the data for the collection from the store of the collection with the uri of the collection.
   * Fires an "add" event for every single item that will be added to the collection. 
   */
  void fetch(){
    store.read(this, function(List<Map<String, Dynamic>> map){
      map.forEach((m) => this.add(new Model.fromJSON(m)));
    } );
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
