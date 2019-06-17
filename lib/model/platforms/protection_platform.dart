import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

///Defines a [ProtectionPlatform] of the [level].
///A [ProtectionPlatform] has a [id] for refernce.
///A [ProtectionPlatform] has [types] for its appearance.
///A [ProtectionPlatform] has a [xPosition].
///A [ProtectionPlatform] has a [yPosition].
///A [ProtectionPlatform] has a [xSize].
///A [ProtectionPlatform] has a [ySize].
///A [ProtectionPlatform] has a [damage] it causes to the [player] on collision.
///A [ProtectionPlatform] has a [protection] protection it gives the [player] on collision.
///A [ProtectionPlatform] has a [jumpFactor] it gives the [player] on collision.
///A [ProtectionPlatform] is either visited or not.
///A [ProtectionPlatform] has a [Hitbox].
class ProtectionPlatform extends Platform {

  ///Constructor to create a [ProtectionPlatform] object for a [level].
  ///[ProtectionPlatform] is positioned in the given coordinates and the given dimension, with the given ID.
  ///[ProtectionPlatform] gets the types: Platform, protectionPlatform and 0 protection and 1 damage. It's jump factor is a standard jump
  ProtectionPlatform(id, xPos, yPos, xDim, yDim)
      : super(
      id,
      ["platform", "protectionPlatform"],
      xPos,
      yPos,
      xDim,
      yDim,
      0,
      3,
      stdJump);

  ///Constructor to create a [ProtectionPlatform] object for a [level], from a json String
  ///Sets the given ID and takes the position and dimension information from the json element.
  ///[ProtectionPlatform] gets the types: Platform, protectionPlatform and 3 seconds of protection and 0 damage. It's jump factor is a standard jump
  ProtectionPlatform.fromJson(int id, Map<String, dynamic> json)
      : super(
      id,
      ["platform", "protectionPlatform"],
      json["xPos"],
      json["yPos"],
      json["xDim"],
      json["yDim"],
      0,
      3,
      stdJump);

  @override

  ///Sets the platform to used.
  void onVisit() {
    visited = true;
    types.remove("protectionPlatform");
    types.add("protectionPlatformUsed");
  }
}