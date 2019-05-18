import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

class Level {
  Player _player;
  List<GameElement> entities = List();

  Level() {
    this._player = new Player();
    entities.add(_player);
    entities.add(NormalPlatform());
  }

  Player get player => _player;

  // moves each entity according to its velocity and gravity
//void moveEntities() => entities.forEach((ele) => ele.move());
}
