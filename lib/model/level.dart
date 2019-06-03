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

  double _height;

  int _targetScore = 0;
  int _targetJumps = 0;
  int _targetheight = 0;
  int _targetPlatforms = 0;

  bool _won = false;

  Level();

  // moves each entity according to its velocity and gravity
  void updateEntities() {
    entities.forEach((element) => element.update());
  }

  readLevel(String s) {}

  Level.fromJson(json) {
    targetScore = json['winCondition'][0];
    targetJumps = json['winCondition'][1];
    targetheight = json['winCondition'][2];
    targetPlatforms = json['winCondition'][3];
    height = json['levelMeta'][0];
    player = Player(this, nextID++, json['player']["xPos"],
        json['player']["yPos"], json['player']["lifes"]);
    entities.add(player);
    json['normalPlatform'].forEach(
        (json) => entities.add(NormalPlatform.fromJson(nextID++, json)));
    json['boostPlatform'].forEach(
        (json) => entities.add(BoostPlatform.fromJson(nextID++, json)));
    json['deadlyPlatform'].forEach(
        (json) => entities.add(DeadlyPlatform.fromJson(nextID++, json)));
    json['protectionPlatform'].forEach(
        (json) => entities.add(ProtectionPlatform.fromJson(nextID++, json)));
  }

  Map<String, int> getWinCondition() {
    return {
      "Score": targetScore,
      "Jumps": targetJumps,
      "Height": targetheight,
      "Platforms": targetPlatforms,
    };
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

  double get height => _height;

  set height(double value) {
    _height = value;
  }

  int get targetPlatforms => _targetPlatforms;

  set targetPlatforms(int value) {
    _targetPlatforms = value;
  }

  int get targetheight => _targetheight;

  set targetheight(int value) {
    _targetheight = value;
  }

  int get targetJumps => _targetJumps;

  set targetJumps(int value) {
    _targetJumps = value;
  }

  int get targetScore => _targetScore;

  set targetScore(int value) {
    _targetScore = value;
  }

  bool get won => _won;

  set won(bool value) {
    _won = value;
  }

  void update() {
    if (player.score >= targetScore &&
        player.xPosition >= targetheight &&
        player.jumps >= targetJumps &&
        player.platforms >= targetPlatforms) {

      won = true;
      print(won);
    }
  }
}
