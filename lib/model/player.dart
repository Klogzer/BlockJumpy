import 'package:jumpdx9001deluxe/model/game_element.dart';

class Player extends GameElement {

  Player() : super(1, 'player'){
    xPosition = 50;
    yPosition = 50;
  }

  void moveLeft() {
    xPosition--;
  }

  void moveRight() {
    xPosition++;
  }
}
