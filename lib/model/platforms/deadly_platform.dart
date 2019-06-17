///Author: Milan Stuhlsatz

import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

///Defines a [DeadlyPlatform] of the [level].
///A [DeadlyPlatform] has a [id] for refernce.
///A [DeadlyPlatform] has [types] for its appearance.
///A [DeadlyPlatform] has a [xPosition].
///A [DeadlyPlatform] has a [yPosition].
///A [DeadlyPlatform] has a [xSize].
///A [DeadlyPlatform] has a [ySize].
///A [DeadlyPlatform] has a [damage] it causes to the [player] on collision.
///A [DeadlyPlatform] has a [protection] protection it gives the [player] on collision.
///A [DeadlyPlatform] has a [jumpFactor] it gives the [player] on collision.
///A [DeadlyPlatform] is either visited or not.
///A [DeadlyPlatform] has a [Hitbox].
class DeadlyPlatform extends Platform {

  ///Constructor to create a [DeadlyPlatform] object for a [level].
  ///[DeadlyPlatform] is positioned in the given coordinates and the given dimension, with the given ID.
  ///[DeadlyPlatform] gets the types: Platform, deadlyPlatform and 0 protection and 1 damage. It's jump factor is a standard jump
  DeadlyPlatform(id, xPos, yPos, xDim, yDim)
      : super(
      id,
      ["platform", "deadlyPlatform"],
      xPos,
      yPos,
      xDim,
      yDim,
      0,
      -1,
      stdJump);

  ///Constructor to create a [DeadlyPlatform] object for a [level], from a json String
  ///Sets the given ID and takes the position and dimension information from the json element.
  ///[DeadlyPlatform] gets the types: Platform, deadlyPlatform and 0 protection and 1 damage. It's jump factor is a standard jump
  DeadlyPlatform.fromJson(int id, Map<String, dynamic> json)
      : super(
      id,
      ["platform", "deadlyPlatform"],
      json["xPos"],
      json["yPos"],
      json["xDim"],
      json["yDim"],
      -1,
      0,
      stdJump);
}
