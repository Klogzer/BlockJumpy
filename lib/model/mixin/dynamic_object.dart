import 'package:jumpdx9001deluxe/model/vector.dart';

mixin DynamicObject {
  int _duration;
  Vector _velocity = new Vector(0, 0);

  void newDaynamicEvent(Vector velocity) {
    _duration = 0;
    _velocity = velocity;
  }

  int get duration => duration;


  Vector get velocity => _velocity;

}