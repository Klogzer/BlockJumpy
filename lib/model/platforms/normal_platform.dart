import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

class NormalPlatform extends Platform {

  NormalPlatform(id, xPos, yPos, xDim, yDim)
      : super(
      id,
      ["platform", "normalPlatform"],
      xPos,
      yPos,
      xDim,
      yDim,
      0,
      0,
      stdJump);

  NormalPlatform.fromJson(int id,Map<String,dynamic>json) : super(id, ["platform", "normalPlatform"], json["xPos"], json["yPos"], json["xDim"], json["yDim"], 0, 0, stdJump);
}
