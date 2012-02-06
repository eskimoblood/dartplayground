class Input {

  InputElement _input;
  
  Input(){
    _input = window.document.query('#new-todo');
    _input.on.keyUp.add((KeyboardEvent event) => addNewTodo(event.keyCode));
  }
  
  void addNewTodo(int keyCode){
    if (event.keyCode != 13) return;
    
    print(_input.value);
  }
  
}
