import 'package:jumpdx9001deluxe/model/game_element.dart';

abstract class Platform extends GameElement {

  Platform(int id, List<String> types, xPos, yPos, xDim, yDim)
      : super(id, types, xPos, yPos, xDim, yDim);

}