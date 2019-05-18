mixin PositionObject {

  double _xPosition;
  double _yPosition;
  // -1,1
  // -1 max speed left, 1 max speed right
  double velocity = 0;
  // -1,1
  // -1 max speed down, 1 max speed up
  double gravity = -1;

  double get xPosition => _xPosition;

  set xPosition(double xPosition) {
    _xPosition = xPosition;
  }

  double get yPosition => _yPosition;

  set yPosition(double yPosition) {
    _yPosition = yPosition;
  }
  // vector based movement
  // function which is reapeatedly called
  void move(){
    this.xPosition += velocity;
    this.yPosition += gravity;
  }
  void accelerate(double dx, double dy){
    velocity = dx;
    gravity = dy;
  }

}
