import 'package:jumpdx9001deluxe/model/game_element.dart';

abstract class Platform extends GameElement {

  bool _visited = false;

  Platform(int id, List<String> types, xPos, yPos, xDim, yDim)
      : super(id, types, xPos, yPos, xDim, yDim);

  bool get visited => _visited;

  set visited(bool value) {
    _visited = value;
  }


}