import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

// static width
class Level {
  Player _player;
  List<GameElement> entities = List();

  Level() {
    int nextID = 0;
    this._player = new Player(this, nextID++, 500, 100);
    entities.add(_player);
    entities.add(NormalPlatform(nextID++, 500, 100, 100, 20));
    entities.add(NormalPlatform(nextID++, 100, 300, 100, 20));
    entities.add(NormalPlatform(nextID++, 800, 500, 100, 20));
    entities.add(NormalPlatform(nextID++, 50, 700, 100, 20));
    entities.add(NormalPlatform(nextID++, 500, 750, 100, 20));
    entities.add(NormalPlatform(nextID++, 1000, 100, 100, 20));
    entities.add(NormalPlatform(nextID++, 800, 700, 100, 20));
    entities.add(NormalPlatform(nextID++, 600, 350, 100, 20));
    entities.add(NormalPlatform(nextID++, 400, 600, 100, 20));
    entities.add(NormalPlatform(nextID++, 3500, 400, 100, 20));
  }

  Player get player => _player;

  // moves each entity according to its velocity and gravity
  void updateEntities() => entities.forEach((element) => element.update());

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
