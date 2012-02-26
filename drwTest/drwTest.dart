#import('dart:html');
#import('../testing/unittest/unittest_dartest.dart');
#import('../testing/dartest/dartest.dart');
#import('../drw/drw.dart');

class drwTest {

  drwTest() {
  }

  void run() {
    group('Point', (){
      
      
      test('should be initialized by a length and an angle', (){
        Vec2D v =  new Vec2D(length:5, angle:  0);
        Expect.equals(5, v.x);
        Expect.equals(0, v.y);
      });
      
      
      test('should be sum with other point', (){
        Vec2D v = new Vec2D(1,1) + new Vec2D(2,1);
        Expect.equals(3, v.x);
        Expect.equals(2, v.y);
      });
      
      test('should be sum with number', (){
        Vec2D v = new Vec2D(1,1) + 10;
        Expect.equals(11, v.x);
        Expect.equals(11, v.y);
      });
      
      test('should be subtract by other point', (){
        Vec2D v = new Vec2D(5,3) - new Vec2D(2,1);
        Expect.equals(3, v.x);
        Expect.equals(2, v.y);
      });
      
      test('should be subtract by a number', (){
        Vec2D v = new Vec2D(2,2) - 1;
        Expect.equals(1, v.x);
        Expect.equals(1, v.y);
      });
      
      test('should be multiply by other point', (){
        Vec2D v = new Vec2D(2,3) * new Vec2D(2,3);
        Expect.equals(4, v.x);
        Expect.equals(9, v.y);
      });
      
      test('should be multiply by a number', (){
        Vec2D v = new Vec2D(2,2) * 3;
        Expect.equals(6, v.x);
        Expect.equals(6, v.y);
      });
      
      test('should be divided by other point', (){
        Vec2D v = new Vec2D(4,8) / new Vec2D(2,4);
        Expect.equals(2, v.x);
        Expect.equals(2, v.y);
      });
      
      test('should be divided by a number', (){
        Vec2D v = new Vec2D(6,8) / 2;
        Expect.equals(3, v.x);
        Expect.equals(4, v.y);
      });
      
      test('should be compared by other point', (){
        Expect.isTrue(new Vec2D(2,2) == new Vec2D(2,2));
        Expect.isTrue(new Vec2D(2,1) != new Vec2D(2,2));
      });
      
      test('should be compared by a number', (){
        Expect.isTrue(new Vec2D(2,2) == 2);
        Expect.isTrue(new Vec2D(1,2) != 2);
      });
      
      test('should be get the distance to another point', (){
        Expect.equals(5, new Vec2D(0, 0).getDistance(new Vec2D(3, 4)));
      });
      
      test('should calc the dot product', (){
        Expect.equals(23, new Vec2D(2, 3).dot(new Vec2D(4, 5)));
      });
      
      test('should calc the cross product', (){
        Expect.equals(-2, new Vec2D(2, 3).cross(new Vec2D(4, 5)));
      });
      
    });
    
    group('Line', function(){
      test('should be initialize by a point a length and an angle', (){
        Line l = new Line(new Vec2D(1,1), length: 10);
        Expect.isTrue(l.p2 == new Vec2D(11, 1));
      });
    });
    
    
  }


}

void main() {
  new drwTest().run();
  new DARTest().run(); 
  
}
