import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

class BoostPlatform extends Platform {
  BoostPlatform(id, xPos, yPos, xDim, yDim)
      : super(id, ["platform", "boostPlatform"], xPos, yPos, xDim, yDim, 0, 0,
            stdJump * 2);
}
