#import('dart:html');
#import('dart:json');
#import('../mvp/mvp_.dart');
#source('Input.dart');
#source('TodoList.dart');
#source('Counter.dart');


void main() {
  Coll collection = new Coll();
  collection.store = new LocalStore();
  collection.uri = 'todo';
  new Input(collection);
  new TodoList(collection);
  new TodoCounter(collection);
  collection.fetch();
  collection.bind('change', ()=>collection.save());
}
