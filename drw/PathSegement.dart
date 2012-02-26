class PathSegment {

  static final String POINT = "point";
  static final String LINE = "line";
  static final String CURVE = "curve";
  
  String type;
  List<Vec2D> points;
  
  PathSegment(){
    points = new List<Vec2D>();
  }
  
  void add(Vec2D point){
    points.add(point);
  }
  
}
