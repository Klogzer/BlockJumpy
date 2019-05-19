import 'package:jumpdx9001deluxe/model/hitbox.dart';
import 'package:jumpdx9001deluxe/model/mixin/position_object.dart';
import 'package:jumpdx9001deluxe/model/mixin/size_object.dart';
import 'package:jumpdx9001deluxe/model/normal_platform.dart';
import 'package:jumpdx9001deluxe/model/player.dart';

abstract class GameElement with PositionObject, SizeObject {

  final int _id;
  final List<String> _types;

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

  Hitbox get hitbox => _hitbox;

  set hitbox(Hitbox value) {
    _hitbox = value;
  }

  Map toJson() => {
    'id':_id,
    'xPosition':xPosition,
    'yPosition':yPosition,
    'xSize':xSize,
    'ySize':ySize,
    'types':_types,
    'hitbox':hitbox
  };
  static GameElement fromJson(Map<String,dynamic> map) {
    int id = map['id'];
    double xPosition = map['xPosition'];
    double yPosition = map['yPosition'];
    double xSize = map['xSize'];
    double ySize = map['ySize'];
    // no Constructor...
    //Hitbox _hitbox = Hitbox.fromJson(map['hitbox']);

    if((map['types']).contains("player")){
      return Player.test();
    }
    if((map['types'] as List).contains("normalPlatform")){
      return NormalPlatform(xPosition,yPosition,xSize,ySize);
    }
    return null;
  }

}
