import 'package:jumpdx9001deluxe/model/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';

class Player extends GameElement with DynamicObject {

  //TODO: This is a stub, functional Constructor needed.
  Player() : super(1, "player", 0, 0, 50, 50);

  @override
  void move() {
    yPosition = yPosition;
  }

  //gets changes and sets value;
  void moveLeft(double factor) {
    xPosition = (xPosition + (2 * factor)) as int;
  }

  //gets changes and sets value;
  void moveRight(double factor) {
    xPosition = (xPosition + (2 * factor)) as int;
  }
}
