class Model extends EventBus implements Hashable{
  Map<String, Dynamic> _model;
  String uri;
  Store _store;
  int _id;
  bool _isNew;
  
  Model(){
    _model = new HashMap<String, String>();
    _store = new XHRStore();
    _isNew = true;
    _id = Math.random() * 100000;
  }
    
  Dynamic operator [] (String key) => _model[key];
  
  void operator []= (String key, value){
   if(key == null) return;
   print(key);
    _model[key]=value;
    print(JSON.stringify(_model));
    trigger('change:' + key, value);
    trigger('change', _model);
  }
  
  void fetch(){
      _store.read(uri, (response)=> model=response );
  }
  
  void save(){
    Function method =  ( _isNew  ?  _store.create : _store.update);
    _isNew = false;
    method(uri, JSON.stringify(_model), ()=>print('saved'));
  }
  
  set model(Map<String, Dynamic> map){
    if(map is Map){
      _model = map;
      trigger('change', _model);
      _model.forEach((key, value)=> trigger('change:' + key, value));
    } else {
      throw new IllegalArgumentException("Passed data wasn't a Map");
    }
  }
  
  int hashCode(){
    return _id;
  }
  
  String toStore(){
    return JSON.stringify(_model);
  }
  
}