import 'package:jumpdx9001deluxe/model/hitbox.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/position_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/size_object.dart';

abstract class GameElement with PositionObject, SizeObject, DynamicObject {
  final int id;
  List<String> types;
  Hitbox hitbox = new Hitbox(true, 0, 0, 0, 0);

  GameElement(this.id, this.types, xPos, yPos, xDim, yDim) {
    xPosition = xPos;
    yPosition = yPos;
    xSize = xDim;
    ySize = yDim;
    hitbox = new Hitbox(true, xPosition, yPosition, xSize, ySize);
  }

  void update() {
    //nothing to do... just override.
  }

  void scroll(value) {
    this.yPosition -= value;
    this.hitbox.yPosition -= value;
  }

  @override
  String toString() {
    return "$id X:$xPosition y:$yPosition";
  }
}
