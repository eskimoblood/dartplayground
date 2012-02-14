class Input {

  InputElement _input; 
  InputElement _checkbox; 
  Coll collection;
  
  Input(this.collection){
    _input = window.document.query('#new-todo');
    _input.on.keyUp.add((KeyboardEvent event) => addNewTodo(event.keyCode));
    _checkbox = window.document.query('#check-all');
    _checkbox.on.click.add((MouseEvent event) => markAll());
  }
  
  void addNewTodo(int keyCode){
    String val = _input.value;
    if (keyCode != 13 || val.isEmpty()) return;
     
    Model m = new Model();
    m['text']  = val;
    collection.add(m);
    collection.save();
    _input.value = "";
  }
  
  void markAll(){
    collection.forEach((m)=> m['done'] = _checkbox.checked);
  }
  
}
