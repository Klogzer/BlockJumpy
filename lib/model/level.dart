import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

// static width
class Level {
  Player _player;
  int _nextID = 0;
  List<GameElement> _entities = List();

  Level();

  // moves each entity according to its velocity and gravity
  void updateEntities() {
    entities.forEach((element) => element.update());
  }

  readLevel(String s) {}

  Level.fromJson(json) {
    player = Player(
        this,nextID++, int.parse(json['player'].first), int.parse(json['player'].last),50,50);
    entities.add(player);
    json['normalPlatform'].forEach((sublist) => entities.add(
        NormalPlatform(nextID++, int.parse(sublist.first), int.parse(sublist.last),50,20)));
    print(entities.toString());
    // mehr Sachen hinzufügen
  }

  Player get player => _player;

  set player(Player value) {
    _player = value;
  }

  List<GameElement> get entities => _entities;

  set entities(List<GameElement> value) {
    _entities = value;
  }

  int get nextID => _nextID;

  set nextID(int value) {
    _nextID = value;
  }


}
