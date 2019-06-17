/// @Author Marius Mauritz
class Vector {
  // float Value x and y
  double x;
  double y;

  /// constructor for vector
  Vector(this.x, this.y);

  /// copy Constructor
  Vector.copy(Vector vector) {
    this.x = vector.x;
    this.y = vector.y;
  }
  // zero Constructor
  Vector.zero() {
    this.x = 0;
    this.y = 0;
  }
}
