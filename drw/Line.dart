class Line {
  Vec2D p1;
  Vec2D p2;
  Vec2D point;
  Vec2D vector;
  bool infinite;
  
  Line(this.p1, this.p2){
    point = p1;
    vector = p2;
    infinite = false;
  }
  
  Line.infinite(this.p1, this.p2){
    point = p1;
    vector = p2 - p1;
    infinite = true;
  }
 
  
  
}
