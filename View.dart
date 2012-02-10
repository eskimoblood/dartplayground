class AbstractView {
   abstract Element getElement();
}

class TodoView extends AbstractView {
  LIElement _li;
  
  TodoView(String todoText){
    _li = new Element.tag('li');
    _li.innerHTML = '<b>$todoText</b>';
  }
  
  Element getElement() => _li;
}
