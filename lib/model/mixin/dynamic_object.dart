import 'package:jumpdx9001deluxe/model/vector.dart';

mixin DynamicObject {
  Vector _acceleration = new Vector(0, 0);

  void newDaynamicEvent(Vector acceleration) {
    this.accelaration.y = acceleration.y;
    //this.accelaration.x = acceleration.x;
  }

  Vector get accelaration => _acceleration;

  set accelaration(Vector accelaration) {
    _acceleration = accelaration;
  }

}