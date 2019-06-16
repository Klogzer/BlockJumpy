import 'package:jumpdx9001deluxe/model/game_element.dart';

abstract class Platform extends GameElement {
  bool visited = false;
  double jumpFactor;
  int damage;
  int protection;

  Platform(int id, List<String> types, xPos, yPos, xDim, yDim, this.damage,
      this.protection, this.jumpFactor)
      : super(id, types, xPos, yPos, xDim, yDim);
}
