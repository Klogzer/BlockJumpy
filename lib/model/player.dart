import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/position_object.dart';

class Player extends GameElement with PositionObject {
  Player() : super(1, 'Player');

  void moveLeft() {
    xPosition--;
  }

  void moveRight() {
    xPosition++;
  }
}
