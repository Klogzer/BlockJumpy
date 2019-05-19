import 'package:jumpdx9001deluxe/model/vector.dart';

mixin DynamicObject {
  int _duration = 0;
  Vector _velocity = new Vector(0, 0);

  void newDaynamicEvent(Vector velocity) {
    _duration = 0;
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