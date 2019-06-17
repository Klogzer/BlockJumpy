/// @Author Marius Mauritz
class Vector {
  /// Speeds range -1 1
  double x;
  double y;

  /// constructor for vector
  Vector(this.x, this.y);

  /// copy Constructor
  Vector.copy(Vector vector) {
    this.x = vector.x;
    this.y = vector.y;
  }

  Vector.zero() {
    this.x = 0;
    this.y = 0;
  }
}
