import 'package:jumpdx9001deluxe/model/game_element.dart';

abstract class Platform extends GameElement {

  bool _visited = false;
  double _jumpFactor;
  int _damage;
  int _protection;

  Platform(int id, List<String> types, xPos, yPos, xDim, yDim, this._damage,
      this._protection, this._jumpFactor)
      : super(id, types, xPos, yPos, xDim, yDim);

  bool get visited => _visited;

  set visited(bool value) {
    _visited = value;
  }

  double get jumpFactor => _jumpFactor;

  set jumpFactor(double value) {
    _jumpFactor = value;
  }

  int get damage => _damage;

  set damage(int value) {
    _damage = value;
  }

  int get protection => _protection;

  set protection(int value) {
    _protection = value;
  }


}