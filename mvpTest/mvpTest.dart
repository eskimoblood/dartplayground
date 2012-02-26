#import('dart:html');
#import('../testing/unittest/unittest_dartest.dart');
#import('../testing/dartest/dartest.dart');
#import('../mvp/mvp_.dart');

class mvpTest {
  
  mvpTest() {
  }

  void run() {
    group('Collection', (){
      test('should get the length', (){
        Coll c = new Coll();
        c.add(new Model());
        c.add(new Model());
        c.add(new Model());
        Expect.equals(3, c.length());
      });
      
      test('should get the fire an "add" event', (){
        Coll c = new Coll();
        bool added = false;
        c.bind('add', (m)=>added = true);
        c.add(new Model());
        Expect.isTrue(added);
      });
      
      test('should should pass the added model when fire an "add" event', (){
        Coll c = new Coll();
        Model added;
        Model toAdd = new Model();
        c.bind('add', (m)=>added = m);
        c.add(toAdd);
        Expect.equals(toAdd, added);
      });
      
      test('should fire a "change" event when adding a model', (){
        Coll c = new Coll();
        Model added;
        Model toAdd = new Model();
        c.bind('add', (m)=>added = m);
        c.add(toAdd);
        Expect.equals(toAdd, added);
      });
      
      test('should fire a "change" event when added  model changed', (){
        Coll c = new Coll();
        Model toAdd = new Model();
        bool modelChanged = false;
        c.add(toAdd);
        c.bind('change', (Model m) => modelChanged = true);
        toAdd.trigger('change', toAdd);
        Expect.isTrue(modelChanged);
      });
      
    });
  }
}

void main() {
  new mvpTest().run();
  new DARTest().run();
}
