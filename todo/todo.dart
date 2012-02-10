#import('dart:html');
#import('dart:json');
#import('../mvp/mvp_.dart');
#source('Input.dart');
#source('TodoList.dart');

class todo {

  todo() {
  }

  void run() {
    Coll<Model> collection = new Coll<Model>();
    collection.store = new LocalStore();
    collection.uri = 'todo';
    new Input(collection);
    new TodoList(collection);
    String localStorage = window.localStorage.getItem('todo');
    print (localStorage);
    List<Map<String, Dynamic>> map = JSON.parse(localStorage);
    map.forEach((m) => collection.add(new Model.fromJSON(m)));
  }
}

void main() {
  new todo().run();
}
