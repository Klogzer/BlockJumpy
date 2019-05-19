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
    entities.add(NormalPlatform(500, 100, 100, 20));
  }

  Player get player => _player;

  // moves each entity according to its velocity and gravity
  void updateEntities() => entities.forEach((ele) => ele.update());

  Map toJson() => {
        'player': _player,
        'entities': entities,
      };

  Level.fromJson(map) {
    // should be a GameElement
    _player = Player.fromJson(map['player']);
    // should be a list
    entities = map['entities'];
  }
}
