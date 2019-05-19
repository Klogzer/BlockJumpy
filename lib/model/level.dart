import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

// static width
class Level {
  Player _player;
  List<GameElement> entities = List();

  Level() {
    this._player = new Player(this);
    entities.add(_player);
    //entities.add(NormalPlatform(500, 100, 100, 20));
    entities.add(NormalPlatform(100, 300, 100, 20));
    entities.add(NormalPlatform(800, 500, 100, 20));
    entities.add(NormalPlatform(50, 700, 100, 20));
    entities.add(NormalPlatform(500, 750, 100, 20));
    entities.add(NormalPlatform(1000, 100, 100, 20));
    entities.add(NormalPlatform(800, 700, 100, 20));
    entities.add(NormalPlatform(600, 350, 100, 20));
    entities.add(NormalPlatform(400, 600, 100, 20));
    entities.add(NormalPlatform(3500, 400, 100, 20));
  }

  Player get player => _player;

  // moves each entity according to its velocity and gravity
  void updateEntities() => entities.forEach((ele) => ele.update());
}
