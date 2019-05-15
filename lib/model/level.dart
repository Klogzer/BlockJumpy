import 'package:jumpdx9001deluxe/model/player.dart';

class Level {
  Player _player;

  Level() {
    this._player = new Player();
  }

  Player get player => _player;

  void movePlayerRight(double factor) {
    player.moveRight();
  }

  void movePlayerLeft(double factor) {
    player.moveLeft();
  }
}
