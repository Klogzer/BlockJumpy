class Vector {
  /// Speeds range -1 1
  double _x;
  double _y;

  /// constructor for vector
  Vector(this._x, this._y);

  /// copy Constructor
  Vector.copy(Vector vector) {
    this.x = vector.x;
    this.y = vector.y;
  }

  Vector.zero(){
    this.x = 0;
    this.y = 0;
  }

  double get y => _y;

  set y(double value) {
    _y = value;
  }

  double get x => _x;

  set x(double value) {
    _x = value;
  }


}
