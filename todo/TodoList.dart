class TodoList {
  UListElement list;
  Coll<Model> collection;
  
  TodoList(this.collection){
    list = window.document.query('#todo-list');
    collection.bind('add', (m) => addItem(m));
  }
  
  void addItem(Model m){
    LIElement li = new Element.html('<li><input type="checkbox" /><span class="todo-content">${m['text']}</span><span class="todo-destroy"/></li>');
    li.query('span.todo-destroy').on.click.add((event) => removeItem(m, li));
    li.query('input').on.click.add((event) => setState(m, li));
    li.attributes['class'] = m['done'] ? 'done' : '';
    li.query('input').checked = m['done'];
    list.insertBefore(li, list.firstElementChild);
  }
  
  void removeItem(Model m, LIElement li){
    li.remove();
    collection.delete(m);
    collection.save();
  }
  
  void setState(Model m, LIElement li){
    InputElement check = li.query('input');
    li.attributes['class'] = check.checked ? 'done' : '';
    m['done'] = check.checked;
    collection.save();
  }
}
