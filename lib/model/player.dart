import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';
import 'package:jumpdx9001deluxe/model/vector.dart';

class Player extends GameElement with DynamicObject {

  Level _level;

  int _score = 0;
  int _jumps = 0;
  int _platforms = 0;

  int _health = 1;
  double _protection = 0;

  Player(this._level, id, xPosition, yPosition, xSize, ySize, health)
      : super(id, ["player"], yPosition, yPosition, xSize, ySize);

  String get getScoreAsText => score.toString();

  void jump(double draft, Platform element) {

    jumps++;
    score += (scoreJump);
    print("jumping1");
    protection += element.protection;
    print("jumping2");
    if (protection <= 0) {
      print("jumping3");
      health += (element.damage);
      print("jumping4");
    }
    print("jumping5");
    if (!element.visited) {
      element.visited = true;
      platforms++;
      score += scorePlatform;
    }
    print("jumping");
    newDynamicEvent(new Vector(draft, element.jumpFactor));
  }

  @override
  void update() {
    //Calculate vertical-vector
    this.acceleration.y *= 0.985;

    //Calculate Position
    this.xPosition += this.acceleration.y;
    this.yPosition += this.acceleration.y - gravity;

    //update Hitbox
    hitbox.xPosition = this.xPosition;
    hitbox.yPosition = this.yPosition;

    //Collision detection
    if (this.acceleration.y <= gravity) {
      print("falling");
      _level.entities.forEach((element) =>
      hitbox.overlap(element.hitbox)
          ? element.types.any((element) => element.contains("player"))
          ? null
          : jump(0, element)
          : null
      );
    }
    if (protection > 0) {
      protection -= 1 / tickModel;
    }
  }

  void accelerate(double dx, double dy) {
    this.acceleration.x = dx * horizontalAccelarationFactor;
  }

  int get platforms => _platforms;

  set platforms(int value) {
    _platforms = value;
  }

  double get hight => yPosition;

  int get jumps => _jumps;

  set jumps(int value) {
    _jumps = value;
  }

  int get score => _score;

  set score(int value) {
    _score = value;
  }

  Level get level => _level;

  set level(Level value) {
    _level = value;
  }

  int get health => _health;

  set health(int value) {
    _health = value;
  }

  double get protection => _protection;

  set protection(double value) {
    _protection = value;
  }


}
