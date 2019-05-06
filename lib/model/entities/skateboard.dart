import 'dart:html';

import 'package:demo/dimension.dart' as prefix0;
import 'package:demo/position.dart';
import 'package:demo/status_modifier.dart';
import 'package:demo/dimension.dart';

import 'package:demo/entity.dart';

class Skateboard implements Entity{
  @override
  bool collidable;

  @override
  Dimension dimension = Dimension(10,10);

  @override
  bool collisionDetection;

  @override
  String name;

  @override
  Position position;

  @override
  bool scrolling;

  @override
  int speed;

  @override
  List<StatusModifier> status;

  @override
  bool visible;

  @override
  bool addEffectToList() {
    // TODO: implement addEffectToList
    return null;
  }

  @override
  bool moveBy(int x, int y) {
    // TODO: implement moveBy
    return null;
  }

  @override
  bool removeStatusModifier() {
    // TODO: implement removeStatusModifier
    return null;
  }

}