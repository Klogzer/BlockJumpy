import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

///Defines a [NormalPlatform] of the [level].
///A [NormalPlatform] has a [id] for refernce.
///A [NormalPlatform] has [types] for its appearance.
///A [NormalPlatform] has a [xPosition].
///A [NormalPlatform] has a [yPosition].
///A [NormalPlatform] has a [xSize].
///A [NormalPlatform] has a [ySize].
///A [NormalPlatform] has a [damage] it causes to the [player] on collision.
///A [NormalPlatform] has a [protection] protection it gives the [player] on collision.
///A [NormalPlatform] has a [jumpFactor] it gives the [player] on collision.
///A [NormalPlatform] is either visited or not.
///A [NormalPlatform] has a [Hitbox].
class NormalPlatform extends Platform {

  ///Constructor to create a [NormalPlatform] object for a [level].
  ///[NormalPlatform] is positioned in the given coordinates and the given dimension, with the given ID.
  ///[NormalPlatform] gets the types: Platform, normalPlatform and 0 protection and 1 damage. It's jump factor is a standard jump
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

  ///Constructor to create a [NormalPlatform] object for a [level], from a json String
  ///Sets the given ID and takes the position and dimension information from the json element.
  ///[NormalPlatform] gets the types: Platform, normalPlatform and 0 protection and 1 damage. It's jump factor is a standard jump
  NormalPlatform.fromJson(int id, Map<String, dynamic> json)
      : super(
      id,
      ["platform", "normalPlatform"],
      json["xPos"],
      json["yPos"],
      json["xDim"],
      json["yDim"],
      0,
      0,
      stdJump);
}
