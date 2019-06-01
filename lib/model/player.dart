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

  Player(this._level, id, xPosition, yPosition, xSize, ySize, this._health)
      : super(id, ["player"], xPosition, yPosition, xSize, ySize);

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

    if (acceleration.y <= stdJump * 0.05 && acceleration.y != 0.0) {
      health = 0;
    }
    //Calculate Position
    this.xPosition += this.acceleration.x;
    this.yPosition += this.acceleration.y - gravity;

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
          : null
      );
    }
    if (protection > 0.0) {
      protection -= 1.0 / tickModel;
    }
    if (health <= 0 && !types.contains("dead")) {
      types.add("dead");
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
