class Line {
  Vec2D p1;
  Vec2D p2;
  
  Line(this.p1, this.p2){}
  
  Line.b(this.p1, int length, [int angle = 0]){
   // p2 = p1 + new Vec2D(angle:angle, length : length);
  }
}
