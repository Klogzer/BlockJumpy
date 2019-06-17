import 'package:jumpdx9001deluxe/constants.dart';

///Defines a [PositionObject] of the [level].
///A [PositionObject] has a xPosition.
///A [PositionObject] has a yPosition.
mixin PositionObject {

  ///The [PositionObject]'s position on the x Axis.
  double _xPosition;

  ///The [PositionObject]'s position on the x Axis.
  double yPosition;

  ///Returns the position on the X-Axis
  double get xPosition => _xPosition;

  ///Sets the [_xPosition], if it overflows the scope, it will be set to 0.
  set xPosition(double xPosition) {
    while (xPosition > 1.0 - playerX) {
      xPosition -= 1 - playerX;
    }

    if (xPosition < 0) {
      xPosition += 1 - playerX;
    }
    _xPosition = xPosition;
  }

}