import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/vector.dart';

class Player extends GameElement with DynamicObject {

  Level level;

  //TODO: This is a stub, functional Constructor needed.
  Player(this.level, id, xPosition, yPosition)
      : super(id, ["player"], yPosition, yPosition, 50, 50);

  void jump(double draft, double force) {
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

    if (accelaration.y <= gravity) level.entities.forEach((element) =>
    hitbox.overlap(element.hitbox) ? element.types.any((element) =>
        element.contains("player")) ? null : jump(0, stdJump) : null);

    if (yPosition > scrollThreshold) level.scroll(yPosition - scrollThreshold);

  }
  void accelerate(double dx, double dy) {
    accelaration.x = dx * horizontalAccelarationFactor;
  }
}
