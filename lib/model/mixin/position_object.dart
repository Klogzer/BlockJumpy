mixin PositionObject {

  double _xPosition;
  double _yPosition;

  double get xPosition => _xPosition;

  set xPosition(double xPosition) {
    while (xPosition > 1) {
      xPosition -= 1;
    }

    if (xPosition < 0) {
      xPosition += 1;
    }
    _xPosition = xPosition;
  }

  double get yPosition => _yPosition;

  set yPosition(double yPosition) {
    _yPosition = yPosition;
  }
}