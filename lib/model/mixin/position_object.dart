import 'package:jumpdx9001deluxe/constants.dart';

mixin PositionObject {

  double _xPosition;
  double _yPosition;

  double get xPosition => _xPosition;

  set xPosition(double xPosition) {
    while (xPosition > StageXDimension) {
      xPosition -= StageXDimension;
    }
    _xPosition = xPosition;
  }

  double get yPosition => _yPosition;

  set yPosition(double yPosition) {
    while (yPosition > StageYDimension) {
      yPosition -= StageYDimension;
    }
    _yPosition = yPosition;
  }

}
