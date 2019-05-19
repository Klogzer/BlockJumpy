import 'package:jumpdx9001deluxe/model/hitbox.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

class NormalPlatform extends Platform {

  NormalPlatform(xPos, yPos, xDim, yDim)
      : super(2, ["platform", "normalPlatform"], xPos, yPos, xDim, yDim);

  NormalPlatform.fromJson(xPos,yPos) : super(0, ["platform", "normalPlatform"], xPos, yPos, 100, 20);
}