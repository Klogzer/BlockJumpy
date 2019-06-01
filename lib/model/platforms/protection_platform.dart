import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

class ProtectionPlatform extends Platform {
  ProtectionPlatform(id, xPos, yPos, xDim, yDim)
      : super(id, ["platform", "protectionPlatform"], xPos, yPos, xDim, yDim, 0,
            3, stdJump);
}
