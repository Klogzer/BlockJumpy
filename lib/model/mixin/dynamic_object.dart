import 'package:jumpdx9001deluxe/model/vector.dart';

mixin DynamicObject {
  Vector acceleration = new Vector(0, 0);

  void newDynamicEvent(Vector acceleration) {
    this.acceleration.y = acceleration.y;
    this.acceleration.x += acceleration.x;
  }

  void reset() {
    this.acceleration.y = 0;
    this.acceleration.x = 0;
  }
}
