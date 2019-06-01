import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

class DeadlyPlatform extends Platform {
  DeadlyPlatform(id, xPos, yPos, xDim, yDim)
      : super(id, ["platform", "deadlyPlatform"], xPos, yPos, xDim, yDim, 0, 1,
            stdJump);
}
