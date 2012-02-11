#import('dart:html');
#import('dart:json');
#import('../mvp/mvp_.dart');
#source('Input.dart');
#source('TodoList.dart');


void main() {
  Coll collection = new Coll();
  collection.store = new LocalStore();
  collection.uri = 'todo';
  new Input(collection);
  new TodoList(collection);
  collection.fetch();
}
