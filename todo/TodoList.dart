class TodoList {
  UListElement list;
  Coll<Model> collection;
  
  TodoList(this.collection){
    list = window.document.query('#todo-list');
    collection.bind('add', (m) => addItem(m));
  }
  
  void addItem(Model m){
    new TodoItem(m, list);
  }

}

class TodoItem{
 Model _m;
 LIElement _li;
 InputElement _checkbox;
 InputElement _edit;
 SpanElement _content;
 
  TodoItem(this._m, UListElement list){
    _li = new Element.html(template());
    
    _li.query('span.todo-destroy').on.click.add(removeItem);
    
    _content = _li.query('label.todo-content');
    _content.on.dblClick.add(startEdit);
    
    _edit = _li.query('input.todo-input');
    _edit.on.blur.add(endEdit);
    
    _checkbox = _li.query('input.check');
    _checkbox.on.click.add(setState);
   
    list.nodes.add(_li);
    _m.bind('destroy', () =>_li.remove());
    _m.bind('change', update);
    
    update(_m);
  } 
  
   removeItem(Event e){
    _li.remove();
    _m.destroy();
  }
  
  void setState(Event e){
    _li.attributes['class'] = _checkbox.checked ? 'done' : '';
    _m['done'] = _checkbox.checked;
  }
  
  void update(Model m){
    bool state = _m['done'];
    _checkbox.checked = state;
    _li.attributes['class'] = state ? 'done' : '';
    _content.innerHTML = _m['text'];
  }
  
  void startEdit(Event e){
    _li.attributes['class'] = 'editing';
    _edit.value = _m['text'];
  }
  
  void endEdit(Event e){
    _m['text'] = _edit.value;
    _li.attributes['class'] = '';
  }
  
  String template (){
    return '''
      <li>
          <div class="display">
            <input class="check" type="checkbox">
            <label class="todo-content"></label>
            <span class="todo-destroy"></span>
          </div>
          <div class="edit">
            <input class="todo-input" type="text">
          </div>
      </li>
    ''';
  }
}
