// Entity is and Object which will be drawn
// Its defined by some unique attributes,
//
import 'dart:html';
import 'package:demo/Position.dart';
import 'package:demo/Dimension.dart';

import 'status_modifier.dart';

abstract class Entity{

  // Attributes, please place attributes belows this line
  String name;
  // the coordinate of the Entity
  Position position;
  // the size of the Entity
  Dimension dimension;
  // boolean to toggle visibility of Entity
  bool visible;
  // boolean to toggle collisionDetection
  bool collisionDetection;
  // boolean to make the object detectable by collision detection
  bool collidable;
  // Scrolls as fast as the Background,
  // therefore it seems as it wasnt moving at all
  bool scrolling;
  // List of all StatusModifier
  List<StatusModifier> status;
  // World the Entity is placed at
  //
  // World world;


  // Functions, please place functions below this line

  bool moveBy(int x,int y){
    position.changePosition(x,y);
    // collision Detection etc
  }
}



