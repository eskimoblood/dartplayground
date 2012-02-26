class Canvas {

  List<Path> paths;
  CanvasElement canvas;
  CanvasRenderingContext2D ctx;
  
  Canvas(CanvasElement this.canvas){
    paths = new List<Path>();
    ctx = canvas.getContext("2d");
  }
  
  void add(Path path) {
    path.bind('change', draw);
    paths.add(path);
  }
  
  void draw(){
    paths.forEach((path) => _drawPath(path));
  }
  
  _drawPath(Path path){
    print(path);
    path.segments.forEach((PathSegment segment){
      print(segment.type);
      switch(segment.type){
      case PathSegment.POINT: _drawPoint(segment);break;
      case PathSegment.LINE: _drawLine(segment);break;
      case PathSegment.CURVE: _drawCurve(segment);break;
      }
    });
  }
  
 void _drawPoint(PathSegment segment){
   
 }
 
 void _drawCurve(PathSegment segment){
   
 }
 
 void _drawLine(PathSegment segment){
   ctx.beginPath();
   ctx.lineWidth = 2;
   ctx.fillStyle = "orange";
   ctx.strokeStyle = "orange";
   List<Vec2D> points = segment.points;
   Vec2D p = points[0];
   ctx.moveTo(p.x, p.y);
   for(num i =1; i<points.length; i++){
     Vec2D point = points[i];
     ctx.lineTo(point.x, point.y);
   }
 }
 
}
