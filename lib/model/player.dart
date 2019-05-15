import 'package:jumpdx9001deluxe/model/game_element.dart';

class Player extends GameElement {

  Player() : super(1, 'Player');

  void moveLeft() {
    xPosition--;
  }

  void moveRight() {
    xPosition++;
  }
}
