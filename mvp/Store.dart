interface Store{
  read(String url, Function callback);
  create(String url, String json, Function callback);
  update(String url, String json, Function callback);
  remove(String url, Function callback);
}

class XHRStore implements Store{
  
  void read(String url, Function callback){
    request("GET", url, '', callback);
  }
  
  void create(String url, String json, Function callback){
    request("POST", url, json, callback);
  }
  
  void update(String url, String json, Function callback){
    request("PUT", url, json, callback);
  }
  
  void remove(String url, Function callback){
    request("DELETE", url, null,callback);
  }
  
  void request(String type, String url, String json,  Function callback){
    XMLHttpRequest request = new XMLHttpRequest();
    request.on.readyStateChange.add((Event event) {
      if (request.readyState == XMLHttpRequest.DONE && request.status == 200) {
        callback(JSON.parse(request.responseText));
      }
    });
    request.open(type, url, true, null, null);
    request.setRequestHeader("Content-type", "application/json");
    request.send(json);
  }
}

class LocalStore implements Store{
  
  Storage _storage;
  
  LocalStore(){
    _storage = window.localStorage;
  }
  
  void read(String id, Function callback){
   callback( _storage.getItem(id));
  }
  
  void create(String url, String json, Function callback){
    _storage.setItem(url, json);
    callback();
  }
  
  void update(String url, String json, Function callback){
    create(url, json, callback);
  }
  
  void remove(String url, Function callback){
    _storage.setItem(url, null);
    callback();
  }
  
}