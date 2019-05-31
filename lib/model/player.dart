import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/vector.dart';

class Player extends GameElement with DynamicObject {
  Level _level;
  int _score = 0;
  int _jumps = 0;
  int _hight = 0;
  int _platforms = 0;

  Player(this._level, id, xPosition, yPosition, xSize, ySize)
      : super(id, ["player"], yPosition, yPosition, xSize, ySize);

  String get getScoreAsText => _score.toString();

  void jump(double draft, double force) {
    _score++;
    print(_score);
    newDynamicEvent(new Vector(draft, force));
  }

  @override
  void update() {
    //Calculate vertical-vector
    setXacceleration(getYacceleration() * 0.985);

    //Calculate Position
    this.xPosition += getXacceleration();
    this.yPosition += getYacceleration() - gravity;

    //update Hitbox
    hitbox.xPosition = this.xPosition;
    hitbox.yPosition = this.yPosition;

    //Collision detection
    if (getYacceleration() <= gravity) {
      _level.entities.forEach((element) =>
      hitbox.overlap(element.hitbox)
          ? element.types.any((element) => element.contains("player"))
          ? null
          : jump(0, stdJump)
          : null);
    }
  }

  void accelerate(double dx, double dy) {
    setXacceleration(dx * horizontalAccelarationFactor);
  }

  @override
  set xPosition(double xPosition) {
    while (xPosition > 1) {
      xPosition -= 1;
    }

    if (xPosition < 0) {
      xPosition += 1;
    }
    this.xPosition = xPosition;
  }
}
