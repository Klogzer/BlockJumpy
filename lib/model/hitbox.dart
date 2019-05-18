import 'package:jumpdx9001deluxe/model/mixin/position_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/size_object.dart';

abstract class Hitbox with PositionObject, SizeObject {
  bool _active;

  //currently needs an element to check if it collides
  // better would be a return of the element it collides with
  bool overlap(Hitbox element) {
    // collision detection based on the positions and sizes ( rectangular only)
    return (this.xPosition < element.xPosition + element.xSize &&
        this.xPosition + this.xSize > element.xPosition &&
        this.yPosition < element.yPosition + element.ySize &&
        this.yPosition + this.ySize > element.yPosition);
  }

  bool get active => _active;

  void activate() {
    _active = true;
  }

  void deactivate() {
    _active = false;
  }
}
