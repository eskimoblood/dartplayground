class Line {
  Point p1;
  Point p2;
  
  Line(this.p1, this.p2){}
  
  Line.b(this.p1, int length, [int angle = 0]){
    p2 = p1 + new Point(angle:angle, length : length);
  }
}
