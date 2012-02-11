class Input {

  InputElement _input;
  Coll collection;
  
  Input(this.collection){
    _input = window.document.query('#new-todo');
    _input.on.keyUp.add((KeyboardEvent event) => addNewTodo(event.keyCode));
  }
  
  void addNewTodo(int keyCode){
    if (keyCode != 13) return;
     
    Model m = new Model();
    m['text']  = _input.value;
    collection.add(m);
    collection.save();
    _input.value = "";
  }
  
}
