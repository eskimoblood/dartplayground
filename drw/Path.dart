class Path extends EventBus{

  List<PathSegment> segments;
  
  Path(){
    segments = new List<PathSegment>();
  }
  
  add(PathSegment ps){
    segments.add(ps);
    trigger('change');
  }
}
