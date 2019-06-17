///Author: Milan Stuhlsatz

import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/platforms/boost_platform.dart';
import 'package:jumpdx9001deluxe/model/platforms/deadly_platform.dart';
import 'package:jumpdx9001deluxe/model/platforms/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/platforms/protection_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

///Defines a [level] of the [game].
/// [level] has a [player].
/// [level] has a [nextID] for creating new enteties.
/// [level] has a List of [entities] for refernce.
/// [level] has a [height] over wich is elemnts are placed.
/// [level] has a [targetScore] the players should reach.
/// [level] has a [targetJumps] the players should reach.
/// [level] has a [targetheight] the players should reach.
/// [level] has a [targetPlatforms] the players should reach.
/// [level] is either [won] or not.

class Level {

  ///the player
  Player player;

  ///the id for the next entity
  int nextID = 0;

  /// the levels entities
  List<GameElement> entities = List();

  ///the levels internal height
  double height;

  ///the score, the player needs to reach
  int targetScore = 0;

  ///the jumps, the player needs to reach
  int targetJumps = 0;

  ///the height, the player needs to reach
  int targetheight = 0;

  ///the amount of platforms, the player needs to visit.
  int targetPlatforms = 0;

  ///if the level is won
  bool won = false;

  ///a constructor that does nothing, possibly unneeded
  Level();

  // moves each entity according to its velocity and gravity
  void updateEntities() {
    entities.forEach((element) => element.update());
  }

  ///builds a level based on the json element and fills the entities list with the elements described in the json.
  ///Parameters like targets and height will be set aswell.
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

  //provides the target values, that need to be reached to win this level. Used by [View]
  Map<String, int> getWinCondition() {
    return {
      "Score": targetScore,
      "Jumps": targetJumps,
      "Height": targetheight,
      "Platforms": targetPlatforms,
    };
  }

  ///Checks if the player won the game by comparing the players status to the target values.
  void update() {
    if (player.score >= targetScore &&
        player.yPosition >= targetheight &&
        player.jumps >= targetJumps &&
        player.platforms >= targetPlatforms) {
      won = true;
    }
  }
}
