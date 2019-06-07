import 'package:jumpdx9001deluxe/constants.dart';

mixin PositionObject {

  double _xPosition;
  double yPosition;

  double get xPosition => _xPosition;

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