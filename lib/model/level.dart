import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/platforms/boost_platform.dart';
import 'package:jumpdx9001deluxe/model/platforms/deadly_platform.dart';
import 'package:jumpdx9001deluxe/model/platforms/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/platforms/protection_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

// static width
class Level {

  Player player;
  int nextID = 0;
  List<GameElement> entities = List();
  double height;
  int targetScore = 0;
  int targetJumps = 0;
  int targetheight = 0;
  int targetPlatforms = 0;
  bool won = false;

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

  void update() {
    if (player.score >= targetScore &&
        player.yPosition >= targetheight &&
        player.jumps >= targetJumps &&
        player.platforms >= targetPlatforms) {
      won = true;
      //print(won);
    }
  }
}
