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

  Level.fromJson(json) {
    _player = Player.fromPosition(
        this, int.parse(json['player'].first), int.parse(json['player'].last));
    entities.add(_player);
    json['normalPlatform'].forEach((sublist) => entities.add(
        NormalPlatform.fromJson(
            int.parse(sublist.first), int.parse(sublist.last))));
    print(entities.toString());
  }
}
