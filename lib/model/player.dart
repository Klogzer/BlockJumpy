import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/vector.dart';

class Player extends GameElement with DynamicObject {

  //TODO: This is a stub, functional Constructor needed.
  Player() : super(1, ["player"], 100, 100, 50, 50);

  void jump(double force, double draft) {
    newDaynamicEvent(new Vector(force, draft));
  }

  void update() {
    yPosition += (-2 * duration + 250) as int;
    if (yPosition <= 0) jump;
  }
}
