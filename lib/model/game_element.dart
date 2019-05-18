import 'package:jumpdx9001deluxe/model/mixin/position_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/size_object.dart';

abstract class GameElement with PositionObject, SizeObject {

  final int _id;
  final List<String> _types;


  GameElement(this._id, this._types, xPos, yPos, xDim, yDim) {
    xPosition = xPos;
    yPosition = yPos;
    xSize = xDim;
    ySize = yDim;
  }
  int get id => _id;

  List<String> get types => _types;


}
