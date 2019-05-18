import 'package:jumpdx9001deluxe/model/vector.dart';

mixin PositionObject {

  double _xPosition;
  double _yPosition;

  // no movement its 0/0
  // Speed in each direction
  Vector normalVector = Vector.zero();

  Vector acceleration = Vector.zero();

  double force;


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

    this.xPosition += normalVector.x;
    this.yPosition += normalVector.y;
  }
  void accelerate(double dx, double dy){
    normalVector.x = dx;
    normalVector.y = dy;
  }

}
