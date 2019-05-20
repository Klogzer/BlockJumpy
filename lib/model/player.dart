import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/vector.dart';

class Player extends GameElement with DynamicObject {

  Level _level;
  int _score = 0;

  Player(this._level, id, xPosition, yPosition, xSize, ySize)
      : super(id, ["player"], yPosition, yPosition, xSize, ySize);

  void jump(double draft, double force) {
    score++;
    print(score as String);
    newDaynamicEvent(new Vector(draft, force));
  }

  @override
  void update() {
    //Calculate vertical-vector
    accelaration.y *= 0.985;

    //Calculate Position
    this.xPosition += accelaration.x;
    this.yPosition += accelaration.y - gravity;

    //update Hitbox
    hitbox.xPosition = xPosition;
    hitbox.yPosition = yPosition;

    //Collision detection
    if (accelaration.y <= gravity) _level.entities.forEach((element) =>
    hitbox.overlap(element.hitbox) ? element.types.any((element) =>
        element.contains("player")) ? null : jump(0, stdJump) : null);

  }
  void accelerate(double dx, double dy) {
    accelaration.x = dx * horizontalAccelarationFactor;
  }

  int get score => _score;

  set score(int value) {
    _score = value;
  }


}
