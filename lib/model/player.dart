import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';
import 'package:jumpdx9001deluxe/model/vector.dart';

class Player extends GameElement {
  Level _level;

  int score = 0;
  int jumps = 0;
  int platforms = 0;
  int health = 1;
  double protection = 0;

  Player(this._level, id, xPosition, yPosition, this.health)
      : super(id, ["player"], xPosition, yPosition, playerX, playerY);

  String get getScoreAsText => score.toString();

  void jump(double draft, Platform element) {
    jumps++;
    score += (scoreJump);

    protection += element.protection;
    if (protection <= 0) {
      health += (element.damage);
    }

    if (!element.visited) {
      element.visited = true;
      platforms++;
      score += scorePlatform;
    }
    newDynamicEvent(new Vector(draft, element.jumpFactor));
  }

  @override
  void update() {
    //Calculate vertical-vector
    this.acceleration.y *= 0.985;

    if (acceleration.y <= stdJump * 0.1 && acceleration.y != 0.0) {
      health = 0;
    }
    //Calculate Position
    this.xPosition += this.acceleration.x;
    this.yPosition += this.acceleration.y - gravity;

    //update texture
    if (acceleration.y - gravity > 0) {
      if (acceleration.x > 0) {
        clearDirection();
        types.add("up_right");
      }
      if (acceleration.x < 0) {
        clearDirection();
        types.add("up_left");
      }
      if (acceleration.x == 0) {
        clearDirection();
        types.add("up_center");
      }
    }
    if (acceleration.y - gravity < 0) {
      if (acceleration.x > 0) {
        clearDirection();
        types.add("down_right");
      }
      if (acceleration.x < 0) {
        clearDirection();
        types.add("down_left");
      }
      if (acceleration.x == 0) {
        clearDirection();
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
          : jump(0, element)
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

  void clearDirection() {
    types.remove("up_right");
    types.remove("up_left");
    types.remove("up_center");
    types.remove("down_right");
    types.remove("down_left");
    types.remove("down_center");
  }

  void accelerate(double dx, double dy) {
    this.acceleration.x = dx * horizontalAccelarationFactor;
  }

  Map<String, int> getStatus() {
    return {
      "Score": score,
      "Jumps": jumps,
      "Height": yPosition.toInt(),
      "Platforms": platforms,
      "Alive": health
    };
  }

  @override
  String toString() {
    return (protection > 0) ? protection.toInt().toString() : super.toString();
  }


}
