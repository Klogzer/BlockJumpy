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
    velocity.y *= 0.985;

    this.xPosition += velocity.x;
    this.yPosition += velocity.y - gravity;

    //Stub for collision detection
    if (yPosition <= 0) jump(0, stdJump);
  }

  void accelerate(double dx, double dy) {
    velocity.x = dx * horizontalAccelarationFactor;
  }
}
