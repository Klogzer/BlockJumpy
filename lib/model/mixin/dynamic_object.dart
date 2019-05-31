import 'package:jumpdx9001deluxe/model/vector.dart';

mixin DynamicObject {
  Vector _acceleration = new Vector(0, 0);

  void newDynamicEvent(Vector acceleration) {
    this._acceleration.y = acceleration.y;
    this._acceleration.x = acceleration.x;
  }

  Vector get acceleration => _acceleration;

  set acceleration(Vector acceleration) {
    _acceleration = acceleration;
  }

  double getXacceleration() {
    return acceleration.x;
  }

  setXacceleration(double x) {
    acceleration.x = x;
  }

  double getYacceleration() {
    return acceleration.y;
  }

  setYacceleration(double y) {
    acceleration.y = y;
  }
}