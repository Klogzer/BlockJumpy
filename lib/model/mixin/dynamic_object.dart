import 'package:jumpdx9001deluxe/model/vector.dart';

mixin DynamicObject {
  int _duration = 0;
  Vector _velocity = new Vector(0, 0);

  void newDaynamicEvent(Vector velocity) {
    this.duration = 0;
    this.velocity.y = velocity.y;
    //this.velocity.x = velocity.x;
  }

  Vector get velocity => _velocity;

  set velocity(Vector velocity) {
    _velocity = velocity;
  }

  int get duration => _duration;

  set duration(int duration) {
    _duration = duration;
  }

}