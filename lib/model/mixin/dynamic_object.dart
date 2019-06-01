import 'package:jumpdx9001deluxe/model/vector.dart';

mixin DynamicObject {
  Vector _acceleration = new Vector(0, 0);

  void newDynamicEvent(Vector acceleration) {
    this._acceleration.y = acceleration.y;
    this._acceleration.x += acceleration.x;
  }

  Vector get acceleration => _acceleration;

  set acceleration(Vector acceleration) {
    _acceleration = acceleration;
  }

  void reset() {
    this._acceleration.y = 0;
    this._acceleration.x = 0;
  }

}