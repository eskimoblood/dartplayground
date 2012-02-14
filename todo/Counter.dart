class TodoCounter {
  Coll collection;
  DivElement panel;
  
  TodoCounter(this.collection){
    collection.bind('change', updateMetaData);
    panel = window.document.query('#todo-stats');
  }
  
  void updateMetaData(){
    panel.innerHTML = '<span class="todo-count">${getCounter()}</span><span class="todo-clear">${getDoneCounter()}</span>';
    panel.query('span.todo-clear').on.click.add(removeAllDone);
  }
  
  String getCounter(){
    int size = collection.length();
    return size == 0 ? '': '${size} ${pluralItem(size)}';
  }
  
  String getDoneCounter(){
    int size = collection.filter((m) => m['done']).length;
    return size == 0 ? '': 'clear ${size} done ${pluralItem(size)}';
  }
  
  String pluralItem(count){
    return count == 1 ? 'item' : 'items';
  }
  
  void removeAllDone(e){
    collection.forEach( function(m) {
      if(m['done']){
        m.destroy();
      }
    });
  }
}
