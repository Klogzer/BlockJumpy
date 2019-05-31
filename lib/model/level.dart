import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

// static width
class Level {
  Player _player;
  int nextID = 0;
  List<GameElement> entities = List();

  Level();

  Player get player => _player;

  // moves each entity according to its velocity and gravity
  void updateEntities() {
    entities.forEach((element) => element.update());
    if (player.yPosition > scrollThreshold) {
      scroll(player.yPosition - scrollThreshold);
    }
  }

  void scroll(double value) =>
      entities.forEach((element) => element.scroll(value));

  readLevel(String s) {}

  Level.fromJson(json) {
    _player = Player(
        this,nextID++, int.parse(json['player'].first), int.parse(json['player'].last),50,50);
    entities.add(_player);
    json['normalPlatform'].forEach((sublist) => entities.add(
        NormalPlatform(nextID++, int.parse(sublist.first), int.parse(sublist.last),50,20)));
    print(entities.toString());
    // mehr Sachen hinzufügen
  }


}
