import 'package:jumpdx9001deluxe/model/mixin/position_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/size_object.dart';

class Hitbox with PositionObject, SizeObject {
  bool active;

  Hitbox(this.active, xPos, yPos, xDim, yDim) {
    xPosition = xPos;
    yPosition = yPos;
    xSize = xDim;
    ySize = yDim;
  }

  bool overlap(Hitbox element) {
    // collision detection based on the positions and sizes ( rectangular only)
    return (this.xPosition < element.xPosition + element.xSize &&
        this.xPosition + this.xSize > element.xPosition &&
        this.yPosition < element.yPosition + element.ySize &&
        this.yPosition + this.ySize > element.yPosition);
  }

  void activate() {
    active = true;
  }

  void deactivate() {
    active = false;
  }

  @override
  String toString() {
    return [xPosition, yPosition, xSize, ySize].toString();
  }
}
