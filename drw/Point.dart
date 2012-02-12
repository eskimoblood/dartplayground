class Point {
  num x;
  num y;
  
  
  Point.b([this._x = 0, this._y = 0, num x= 0, num y=0, num length = 0, num angle=0]){
    if(length != 0){
        x += length * Math.cos(angle);
        y += length * Math.sin(angle);
    }
  }

  
  operator + (int a) => new Point(x + a, y + a);
  operator + (Point p) => new Point(x + p.x, y + p.y);
  
  operator - (int a) => new Point(x - a, y - a);
  operator - (Point p) => new Point(x - p.x, y - p.y);
  
  operator * (int a) => new Point(x * a, y * a);
  operator * (Point p) => new Point(x * p.x, y * p.y);
  
  operator / (int a) => new Point(x / a, y / a);
  operator / (Point p) => new Point(x / p.x, y / p.y);
  
  operator % (int a) => new Point(x % a, y % a);
  operator % (Point p) => new Point(x % p.x, y % p.y);
  
  operator == (int a) => x == a &&  y == a;
  operator == (Point p) => x == p.x && y == p.y;
  

}
