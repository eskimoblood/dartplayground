#import('dart:html');
#import('dart:json');
#source('Router.dart');
#source('Place.dart');
#source('Event.dart');
#source('ActivityMapper.dart');
#source('AbstractController.dart');
#source('View.dart');

class MVP {

  MVP() {
  }

  void run() {
    write("Hello World!");
    
  }

  void write(String message) {
  
  }
}

void main() {
  new MVP().run();
  HistoryManger hm = new HistoryManger();
  ActivityMapper am = new ActivityMapper(hm, document.query('#mainPanel'));
  am.bindRoute("/home", new TodoPresenter(new TodoView('home'), 'home'));
  am.bindRoute("/page1", new TodoPresenter(new TodoView('page1'), 'home'));
  am.bindRoute("/page2", new TodoPresenter(new TodoView('page2'), 'home'));
}
