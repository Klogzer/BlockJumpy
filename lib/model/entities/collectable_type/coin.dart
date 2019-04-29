
import 'package:demo/position.dart';
import 'package:demo/status_modifier.dart';

import '../collectable_type.dart';

class Coin extends CollectableType{
  @override
  bool collidable;

  @override
  bool collisionDetection;

  @override
  var dimension;

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