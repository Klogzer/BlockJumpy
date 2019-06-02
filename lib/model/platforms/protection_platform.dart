import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

class ProtectionPlatform extends Platform {
  ProtectionPlatform(id, xPos, yPos, xDim, yDim)
      : super(id, ["platform", "protectionPlatform"], xPos, yPos, xDim, yDim, 0,
            3, stdJump);

  ProtectionPlatform.fromJson(int id,Map<String,dynamic>json) : super(id, ["platform", "protectionPlatform"], json["xPos"], json["yPos"], json["xDim"], json["yDim"], 0, 3, stdJump);

}
