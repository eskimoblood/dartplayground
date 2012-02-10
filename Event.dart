
/**
 * Simple string based event pubSub.
 */

class EventBus {
    Map<String, List<Function>> _eventStore;
    
    bind(String name, Function function){
      if(_eventStore == null) {
        _eventStore = {};
      }
      if(_eventStore[name] == null){
        _eventStore[name]=[];
      }
       _eventStore[name].add(function);
      
    } 
    
    void trigger(String name, [value]){
      List<Function> functions = _eventStore[name];
      if(functions == null){
        return;
      }
      functions.forEach((el) => value == null ? el() : el(value));
    }
    
    void unbind(String name, [Function function]){
      List<Function> functions = _eventStore[name];

      if(function == null) {
        _eventStore.remove(name);
      } else {        
        _eventStore[name] = functions.filter((f) =>  f !== function );
      }
    } 
}
