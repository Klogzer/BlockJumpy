import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/hitbox.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/vector.dart';

class Player extends GameElement with DynamicObject {

  Level level;

  //TODO: This is a stub, functional Constructor needed.
  Player.newP(id,List<String> types,xPos,yPos,xSize,ySize) : super(id, types, xPos, yPos, xSize, ySize);
  Player.test() : super(1, ["player"], 200, 200, 50, 50);
  Player(this.level) : super(1, ["player"], 100, 100, 50, 50);

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

    if (yPosition <= 0) jump(0, stdJump);
  }
  void accelerate(double dx, double dy) {
    accelaration.x = dx * horizontalAccelarationFactor;
  }

  Player.fromPosition(this.level,xPos, yPos) : super(100, ["player"], xPos, yPos, 50, 50);

}
