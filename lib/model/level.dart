import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

// static width
class Level {
  Player _player;
  int nextID = 0;
  List<GameElement> entities = List();

  Level() {


    this._player = new Player(this, nextID++, 500, 100, 50, 50);
    entities.add(_player);
    entities.add(NormalPlatform(nextID++, 500, 100, 50, 20));
    entities.add(NormalPlatform(nextID++, 100, 300, 50, 20));
    entities.add(NormalPlatform(nextID++, 800, 500, 50, 20));
    entities.add(NormalPlatform(nextID++, 50, 700, 50, 20));
    entities.add(NormalPlatform(nextID++, 500, 750, 50, 20));
    entities.add(NormalPlatform(nextID++, 1000, 100, 50, 20));
    entities.add(NormalPlatform(nextID++, 800, 700, 50, 20));
    entities.add(NormalPlatform(nextID++, 600, 350, 50, 20));
    entities.add(NormalPlatform(nextID++, 400, 600, 50, 20));
    entities.add(NormalPlatform(nextID++, 3500, 400, 50, 20));

//    _player = Player(this, nextID++, int.parse(json['player'].first), int.parse(json['player'].last), 50, 50);
//    entities.add(_player);
//
//    json['normalPlatform'].forEach((sublist) => entities.add(NormalPlatform(nextID++, int.parse(sublist.first), int.parse(sublist.last), 100, 20)));
//    print(entities.toString());

  }

  Player get player => _player;

  // moves each entity according to its velocity and gravity
  void updateEntities() {
    entities.forEach((element) => element.update());
    if (player.yPosition > scrollThreshold) scroll(
        player.yPosition - scrollThreshold);
  }

  void scroll(double value) =>
      entities.forEach((element) => element.scroll(value));

  readLevel(String s) {


  }

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
