/**
 * Simple model inspired by backbone.
 */ 

class Model extends EventBus{
  Map<String, Dynamic> _model;
  String _url = "/test";
  Store _store;
  String _id;
  
  Model(){
    _model = new HashMap<String, Dynamic>();
    _store = new XHRStore();
  }
    
  Dynamic operator [] (String key) => _model[key];
  
  void operator []= (String key, value){
   if(key == null) return;
    _model[key]=value;
    trigger('change:' + key, value);
    trigger('change', _model);
    
  }
  
  void fetch(){
      _store.read(_url, (response)=> model=response );
  }
  
  void save(){
    Function method =  ( _model['id'] != null ?  _store.create : _store.update);
    method(_url, JSON.stringify(_model), ()=>print('saved'));
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
  
}


