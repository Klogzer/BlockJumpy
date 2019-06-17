///Author: Milan Stuhlsatz

import 'package:jumpdx9001deluxe/model/mixin/position_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/size_object.dart';

///Defines a [Hitbox] of [GameElement].
///A [Hitbox] has a [xPosition].
///A [Hitbox] has a [yPosition].
///A [Hitbox] has a [xSize].
///A [Hitbox] has a [ySize].
class Hitbox with PositionObject, SizeObject {

  ///Constructor to create a [Hitbox] object for a [GameElement].
  ///[Hitbox] is positioned in the given coordinates and the given dimension.
  Hitbox(xPos, yPos, xDim, yDim) {
    xPosition = xPos;
    yPosition = yPos;
    xSize = xDim;
    ySize = yDim;
  }

  /// collision detection based on the positions and sizes ( rectangular only)
  bool overlap(Hitbox element) {
    return (this.xPosition < element.xPosition + element.xSize &&
        this.xPosition + this.xSize > element.xPosition &&
        this.yPosition < element.yPosition + element.ySize &&
        this.yPosition + this.ySize > element.yPosition);
  }
}
