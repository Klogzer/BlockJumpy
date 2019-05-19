import 'dart:convert';

import 'package:build_daemon/data/serializers.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

class Level {
  String parsed =
      '{"entities":[{"id":1,"xPosition":100,"yPosition":100,"xSize":50,"ySize":50,"hitbox":{"xPosition":0,"yPosition":0,"xSize":0,"ySize":0}},{"id":2,"xPosition":0,"yPosition":0,"xSize":50,"ySize":50,"hitbox":{"xPosition":0,"yPosition":0,"xSize":0,"ySize":0}}]}';
  Player _player;
  Map<String,List<GameElement>> map = Map();

  Level() {

    this._player = new Player.test();
    map.putIfAbsent("player", () => [_player]);
    map.putIfAbsent("normalPlatorm", () => [NormalPlatform(500, 100, 100, 20)]);
    print(map.toString());
  }

  Player get player => _player;


  // moves each entity according to its velocity and gravity
  void updateEntities() => map.forEach((key,List<GameElement> list)=> list.forEach((ele)=> ele.update()));
}
