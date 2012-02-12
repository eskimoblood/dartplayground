interface Store{
  read(Storeable storeable, Function callback);
  create(Storeable storeable, Function callback);
  update(Storeable storeable, Function callback);
  delete(Storeable storeable, Function callback);
}

class XHRStore implements Store{
  
  void read(Storeable storeable, Function callback){
    request("GET", storeable.uri, '', callback);
  }
  
  void create(Storeable storeable, Function callback){
    request("POST", storeable.uri, storeable.toStore(), callback);
  }
  
  void update(Storeable storeable, Function callback){
    request("PUT", storeable.uri, storeable.toStore(), callback);
  }
  
  void delete(Storeable storeable, Function callback){
    request("DELETE", storeable.uri, null,callback);
  }
  
  void request(String type, String url, String payload,  Function callback){
    XMLHttpRequest request = new XMLHttpRequest();
    request.on.readyStateChange.add((Event event) {
      if (request.readyState == XMLHttpRequest.DONE && request.status == 200) {
        callback(JSON.parse(request.responseText));
      }
    });
    request.open(type, url, true, null, null);
    request.setRequestHeader("Content-type", "application/json");
    request.send(payload);
  }
}

class LocalStore implements Store{
  
  Storage _storage;
  
  LocalStore(){
    _storage = window.localStorage;
  }
  
  void read(Storeable storeable, Function callback){
    callback(JSON.parse(window.localStorage.getItem(storeable.uri)));
  }
  
  void create(Storeable storeable, Function callback){
    _storage.setItem(storeable.uri, storeable.toStore());
    callback();
  }
  
  void update(Storeable storeable, Function callback){
    create(storeable, callback);
  }
  
  void delete(Storeable storeable, Function callback){
    _storage.setItem(storeable.uri, null);
    callback();
  }
  
}