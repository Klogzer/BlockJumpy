import 'package:jumpdx9001deluxe/model/position_object.dart';
import 'package:jumpdx9001deluxe/model/size_object.dart';

abstract class GameElement with PositionObject, SizeObject {

  final int _id;
  final String _type;

  GameElement(this._id, this._type);

  int get id => _id;

  String get type => _type;
}
