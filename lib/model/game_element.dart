import 'package:jumpdx9001deluxe/model/hitbox.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/position_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/size_object.dart';

abstract class GameElement with PositionObject, SizeObject,DynamicObject {

  final int _id;
  List<String> _types;

  Hitbox _hitbox = new Hitbox(true, 0, 0, 0, 0);

  GameElement(this._id, this._types, xPos, yPos, xDim, yDim){
    xPosition = xPos;
    yPosition = yPos;
    xSize = xDim;
    ySize = yDim;
    _hitbox = new Hitbox(true, xPosition, yPosition, xSize, ySize);
  }
  int get id => _id;

  List<String> get types => _types;

  void update() {}

  void scroll(value) {
    this.yPosition -= value;
    this.hitbox.yPosition -= value;
  }

  Hitbox get hitbox => _hitbox;

  set hitbox(Hitbox hitbox) {
    _hitbox = hitbox;
  }
  @override
  String toString() {
    return "";
    //return "$id X:$xPosition y:$yPosition";
  }

}
