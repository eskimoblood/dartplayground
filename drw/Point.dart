class Vec2D {
  num x;
  num y;
  
  Vec2D([this.x = 0, this.y = 0, num length = 0, num angle=0]){
    if(length != 0){
        x += length * Math.cos(angle);
        y += length * Math.sin(angle);
    }
  }
  
  Vec2D operator+(var operator) { 
    if(operator is Vec2D){
      return   new Vec2D(x + operator.x, y + operator.y);
    } else if(operator is num){
      return   new Vec2D(x + operator, y + operator);
    }
  } 
  
  Vec2D operator-(var operator) { 
    if(operator is Vec2D){
      return   new Vec2D(x - operator.x, y - operator.y);
    } else if(operator is num){
      return   new Vec2D(x - operator, y - operator);
    }
  } 
  
  Vec2D operator*(var operator) { 
    if(operator is Vec2D){
      return   new Vec2D(x * operator.x, y * operator.y);
    } else if(operator is num){
      return   new Vec2D(x * operator, y * operator);
    }
  } 
  
  Vec2D operator/(var operator) { 
    if(operator is Vec2D){
      return   new Vec2D(x / operator.x, y / operator.y);
    } else if(operator is num){
      return   new Vec2D(x / operator, y / operator);
    }
  } 
  
  Vec2D operator%(var operator) { 
    if(operator is Vec2D){
      return   new Vec2D(x % operator.x, y % operator.y);
    } else if(operator is num){
      return   new Vec2D(x % operator, y % operator);
    }
  } 
  
  bool operator==(var operator) { 
    if(operator is Vec2D){
      return   x == operator.x && y == operator.y;
    } else if(operator is num){
      return   x == operator && y == operator;
    }
  } 
  
  num getDistance (Vec2D point) {
    Vec2D dist = point - this;
    return Math.sqrt(dist.x * dist.x + dist.y * dist.y);
  }
  
  num dot(Vec2D point) =>  x * point.x + y * point.y;
  
  num cross(Vec2D point) => x * point.y - y * point.x;
  
  num getAngle (Vec2D point) => Math.acos(dot(point));
  
  String toString() => '{"x":${x},"y":${y}}';
  
}
