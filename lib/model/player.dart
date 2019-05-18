import 'package:jumpdx9001deluxe/model/mixin/dynamic_object.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';

class Player extends GameElement with DynamicObject {

  //TODO: This is a stub, functional Constructor needed.
  Player() : super(1, ["player"], 0, 0, 50, 50);


  void setVelocity(double dx){
    this.velocity = dx;
  }
}
