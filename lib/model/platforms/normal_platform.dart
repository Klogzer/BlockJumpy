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
}
