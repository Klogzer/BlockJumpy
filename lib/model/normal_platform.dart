import 'package:jumpdx9001deluxe/model/hitbox.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

class NormalPlatform extends Platform {

  NormalPlatform(xPos, yPos, xDim, yDim)
      : super(2, ["platform", "normalPlatform"], xPos, yPos, xDim, yDim);

  NormalPlatform.fromJson(Map<String, dynamic> json) : super(json['id'],json['types'].cast<String>(), json['xPosition'], json['yPosition'], json['xSize'], json['ySize']) {
    hitbox = json['hitbox'] != null ? new Hitbox.fromJson(json['hitbox']) : null;
  }
}