import 'package:jumpdx9001deluxe/model/vector.dart';

///Defines a [DynamicObject] of the [level]
///A [DynamicObject] has a acceleration (a vector defining movement directions).
///Each vector element has a X and Y Dimension.
mixin DynamicObject {

  ///Movement Direction
  Vector acceleration = new Vector(0, 0);

  /// Accelerates the Object in the given direction.
  void newDynamicEvent(Vector acceleration) {
    this.acceleration.y = acceleration.y;
    this.acceleration.x += acceleration.x;
  }

}
