import 'package:jumpdx9001deluxe/constants.dart';

mixin PositionObject {

  double _xPosition;
  double _yPosition;

  double get xPosition => _xPosition;

  set xPosition(double xPosition) {
    while (xPosition > StageXDimension) {
      xPosition -= StageXDimension;
    }

    if (xPosition < 0) {
      xPosition += StageXDimension;
    }

    _xPosition = xPosition;
  }

  double get yPosition => _yPosition;

  set yPosition(double yPosition) {
    if (yPosition > StageYDimension) {
      yPosition -= StageYDimension;
    }

//    if (yPosition < 0) {
//      yPosition += StageYDimension;
//    }

    _yPosition = yPosition;
  }

}
