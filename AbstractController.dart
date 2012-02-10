
class AbstractPresenter {
  abstract void start(Element panel);
  
  void stop(){}
}


class TodoPresenter extends AbstractPresenter {
  TodoView _view;
  String _text;
  
  TodoPresenter(this._view, String this._text){
  }
  
   void start(Element panel){
    panel.elements = [_view];
  }
   
  void stop(){
    print(_text);
  }
}