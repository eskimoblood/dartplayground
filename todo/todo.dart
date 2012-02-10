#import('dart:html');
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
  }
}

void main() {
  new todo().run();
}
