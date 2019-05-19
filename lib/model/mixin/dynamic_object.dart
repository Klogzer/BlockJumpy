import 'package:jumpdx9001deluxe/model/vector.dart';

mixin DynamicObject {
  Vector _velocity = new Vector(0, 0);

  void newDaynamicEvent(Vector velocity) {
    this.velocity.y = velocity.y;
    //this.velocity.x = velocity.x;
  }

  Vector get velocity => _velocity;

  set velocity(Vector velocity) {
    _velocity = velocity;
  }

}