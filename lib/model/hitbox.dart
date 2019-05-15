import 'package:jumpdx9001deluxe/model/position_object.dart';
import 'package:jumpdx9001deluxe/model/size_object.dart';

class Hitbox with PositionObject, SizeObject {

  bool _active;

  Hitbox(this._active);

   bool overlap(Hitbox element) {
     return false;
     //TODO: implement functionality

   }

  bool get active => _active;

   void activate() {
     _active = true;

   }

   void deactivate() {
     _active = false;

   }

}