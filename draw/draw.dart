#import('dart:html');
#import('../drw/drw.dart');


void main() {
  Canvas canvas= new Canvas(window.document.query('#cnvs'));
  Path p = new Path();
  canvas.add(p);
  PathSegment ps = new PathSegment();
  
  ps.type = PathSegment.LINE;
  
  ps.add(new Vec2D(1, 1 ));
  ps.add(new Vec2D(1, 10 ));
  ps.add(new Vec2D(11, 10 ));
  p.add(ps);
}
