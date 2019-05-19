import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/vector.dart';

class Player extends GameElement with DynamicObject {

  //TODO: This is a stub, functional Constructor needed.
  Player() : super(1, ["player"], 100, 100, 50, 50);

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
    //Stub for collision detection
    if (yPosition <= 0) jump(0, stdJump);
  }

  void accelerate(double dx, double dy) {
    accelaration.x = dx * horizontalAccelarationFactor;
  }
}
