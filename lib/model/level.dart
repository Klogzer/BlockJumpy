import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/platforms/boost_platform.dart';
import 'package:jumpdx9001deluxe/model/platforms/deadly_platform.dart';
import 'package:jumpdx9001deluxe/model/platforms/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/platforms/protection_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

// static width
class Level {
  Player _player;
  int _nextID = 0;
  List<GameElement> _entities = List();

  double _hight;

  int _targetScore = 0;
  int _targetJumps = 0;
  int _targetHight = 0;
  int _targetPlatforms = 0;

  Level();

  // moves each entity according to its velocity and gravity
  void updateEntities() {
    entities.forEach((element) => element.update());
  }

  readLevel(String s) {}

  Level.fromJson(json) {
    targetScore = json['winCondition'][0];
    targetJumps = json['winCondition'][1];
    targetHight = json['winCondition'][2];
    targetPlatforms = json['winCondition'][3];
    hight = json['levelMeta'][0];
    player = Player(
        this,
        nextID++,
        json['player']["xPos"],
        json['player']["yPos"],
        json['player']["xDim"],
        json['player']["yDim"],
        json['player']["lifes"]);
    entities.add(player);
    json['normalPlatform'].forEach((json) => entities.add(NormalPlatform.fromJson(nextID++,json)));
    json['boostPlatform'].forEach((json) =>  entities.add(BoostPlatform.fromJson(nextID++,json)));
    json['boostPlatform'].forEach((json) =>  entities.add(DeadlyPlatform.fromJson(nextID++,json)));
    json['boostPlatform'].forEach((json) =>  entities.add(ProtectionPlatform.fromJson(nextID++,json)));
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

  double get hight => _hight;

  set hight(double value) {
    _hight = value;
  }

  int get targetPlatforms => _targetPlatforms;

  set targetPlatforms(int value) {
    _targetPlatforms = value;
  }

  int get targetHight => _targetHight;

  set targetHight(int value) {
    _targetHight = value;
  }

  int get targetJumps => _targetJumps;

  set targetJumps(int value) {
    _targetJumps = value;
  }

  int get targetScore => _targetScore;

  set targetScore(int value) {
    _targetScore = value;
  }
}
