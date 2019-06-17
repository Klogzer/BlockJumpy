///Author: Milan Stuhlsatz

import 'package:jumpdx9001deluxe/model/hitbox.dart';
import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/position_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/size_object.dart';

///Defines a [GameElement] of the [level].
///A [GameElement] has a [id] for refernce.
///A [GameElement] has [types] for its appearance.
///A [GameElement] has a [xPosition].
///A [GameElement] has a [yPosition].
///A [GameElement] has a [xSize].
///A [GameElement] has a [ySize].
///A [GameElement] has a [Hitbox].
abstract class GameElement with PositionObject, SizeObject, DynamicObject {
  final int id;
  List<String> types;
  Hitbox hitbox = new Hitbox(0, 0, 0, 0);

  ///Constructor to create a [GameElement] object for a [level].
  ///[GameElement] is positioned in the given coordinates and the given dimension, with the given ID.
  GameElement(this.id, this.types, xPos, yPos, xDim, yDim) {
    xPosition = xPos;
    yPosition = yPos;
    xSize = xDim;
    ySize = yDim;
    hitbox = new Hitbox(xPosition, yPosition, xSize, ySize);
  }

  ///What ever needs to be done, if the game ticks. In this case nothing.
  void update() {
    //nothing to do... just override.
  }
}
