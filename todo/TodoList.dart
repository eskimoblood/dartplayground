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
 
  TodoItem(this._m, UListElement list){
    _li = new Element.html('<li><p><input type="checkbox" /><span class="todo-content">${_m['text']}</span><span class="todo-destroy"/></p></li>');
    _li.query('span.todo-destroy').on.click.add((event) => removeItem(_m, _li));
    _li.query('input').on.click.add((event) => setState(_m, _li));
    _li.attributes['class'] = _m['done'] ? 'done' : '';
    _li.query('input').checked = _m['done'];
    list.insertBefore(_li, list.firstElementChild);
    _m.bind('destroy', ()=>_li.remove());
    _m.bind('change', (m)=> update());
  } 
  
  void removeItem(Model m, LIElement li){
    li.remove();
    m.destroy();
  }
  
  void setState(Model m, LIElement li){
    InputElement check = li.query('input');
    li.attributes['class'] = check.checked ? 'done' : '';
    _m['done'] = check.checked;
  }
  
  void update(){
    bool state = _m['done'];
    _li.query('input').checked = state;
    _li.attributes['class'] = state ? 'done' : '';
    
  }
  
}
