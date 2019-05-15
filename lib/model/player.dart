import 'package:jumpdx9001deluxe/model/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';

class Player extends GameElement with DynamicObject {

  Player() : super(1, 'player');

  @override
  void move() {
    yPosition = yPosition;
  }

  //gets changes and sets value;
  void moveLeft() {
    xPosition--;
  }

  //gets changes and sets value;
  void moveRight() {
    xPosition++;
  }
}
