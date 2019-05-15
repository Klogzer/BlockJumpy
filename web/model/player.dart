import 'game_element.dart';
import 'position_object.dart';

class Player extends GameElement with PositionObject {
  Player() : super(1, 'Player');

  void moveLeft() {
    xPosition--;
  }

  void moveRight() {
    xPosition++;
  }
}
