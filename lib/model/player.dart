///Author: Milan Stuhlsatz

import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';
import 'package:jumpdx9001deluxe/model/vector.dart';

///Defines a [Player] of the [level].
///A [Player] has a [id] for refernce.
///A [Player] has [types] for its appearance.
///A [Player] has a [xPosition].
///A [Player] has a [yPosition].
///A [Player] has a [xSize].
///A [Player] has a [ySize].
///A [Player] has a [Hitbox].
///A [Player] has a [score].
///A [Player] has a counter for [jumps].
///A [Player] visited a certain amount of [platforms].
///A [Player] has a [health].
///A [Player] has some seconds of [protection].
///A [Player] has a [_level].
class Player extends GameElement {

  ///the level, this player element is part of, for reference.
  Level _level;

  ///the players score.
  int score = 0;

  ///the counter for jumps, the player performed.
  int jumps = 0;

  ///the amount of platforms the player visited.
  int platforms = 0;

  ///the players health.
  int health = 1;

  ///seconds of protection, the player has.
  double protection = 0;

  ///Constructor to create a [Player] object for a [level].
  ///[Player] is positioned in the given coordinates and the given dimension, with the given ID and health.
  Player(this._level, id, xPosition, yPosition, this.health)
      : super(id, ["player"], xPosition, yPosition, playerX, playerY);

  ///If the collision detection in [update] concluded, the player should jump, this handles it.
  ///The [jumps] counter is increased
  ///The element it collided with will be informed.
  ///The players score, health and protection will be updated accordingly.
  ///The movement vector will be renewed.
  void jump(Platform element) {
    jumps++;
    score += (scoreJump);

    if (!element.visited) {
      element.onVisit();
      platforms++;
      score += scorePlatform;
      protection += element.protection;
    }
    if (protection <= 0) {
      health += (element.damage);
    }
    newDynamicEvent(new Vector(0, element.jumpFactor));
  }


  @override

  ///Performs the necessary updates, if the games model ticks.
  ///The acceleration will be adjusted and the new position will be calculated.
  ///If the player moves to fast he dies, so the health may be set to 0.
  ///Based on the direction of the players movement, it's texture will be choosen, by assigning the  correct values to [types].
  ///It will check if the player collides with anything.
  ///Finally, the protection will be decreased.
  void update() {
    //Calculate vertical-vector
    this.acceleration.y *= 0.985;

    if (acceleration.y <= stdJump * 0.13 && acceleration.y != 0.0) {
      health = 0;
    }
    //Calculate Position
    this.xPosition += this.acceleration.x;
    this.yPosition += this.acceleration.y - gravity;

    //update texture
    if (acceleration.y - gravity > 0) {
      if (acceleration.x > 0) {
        clearTexture();
        types.add("up_right");
      }
      if (acceleration.x < 0) {
        clearTexture();
        types.add("up_left");
      }
      if (acceleration.x == 0) {
        clearTexture();
        types.add("up_center");
      }
    }
    if (acceleration.y - gravity < 0) {
      if (acceleration.x > 0) {
        clearTexture();
        types.add("down_right");
      }
      if (acceleration.x < 0) {
        clearTexture();
        types.add("down_left");
      }
      if (acceleration.x == 0) {
        clearTexture();
        types.add("down_center");
      }
    }
    //update Hitbox
    hitbox.xPosition = this.xPosition;
    hitbox.yPosition = this.yPosition;

    //Collision detection
    if (this.acceleration.y <= gravity) {
      _level.entities.forEach((element) =>
      hitbox.overlap(element.hitbox)
          ? element.types.any((element) => element.contains("player"))
          ? null
          : jump(element)
          : null);
    }

    if (protection > 0.0) {
      protection -= 1.0 / tickModel;

      if (!types.contains("protected")) {
        types.add("protected");
        //print("player aquired protection");
      }
    } else {
      if (types.contains("protected")) {
        //print("player lost protection");
        types.remove("protected");
      }
    }
  }

  ///Removes all texture related tags from types.
  void clearTexture() {
    types.remove("up_right");
    types.remove("up_left");
    types.remove("up_center");
    types.remove("down_right");
    types.remove("down_left");
    types.remove("down_center");
  }

  ///assigns the horizonatal movement to player
  void accelerate(double dx, double dy) {
    this.acceleration.x = dx * horizontalAccelarationFactor;
  }

  ///Returns the players Status related values
  Map<String, int> getStatus() {
    return {
      "Score": score,
      "Jumps": jumps,
      "Height": yPosition.toInt(),
      "Platforms": platforms,
      "Alive": health
    };
  }
}
