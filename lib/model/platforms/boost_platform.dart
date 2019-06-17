///Author: Milan Stuhlsatz

import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/platform.dart';

///Defines a [BoostPlatform] of the [level].
///A [BoostPlatform] has a [id] for refernce.
///A [BoostPlatform] has [types] for its appearance.
///A [BoostPlatform] has a [xPosition].
///A [BoostPlatform] has a [yPosition].
///A [BoostPlatform] has a [xSize].
///A [BoostPlatform] has a [ySize].
///A [BoostPlatform] has a [damage] it causes to the [player] on collision.
///A [BoostPlatform] has a [protection] protection it gives the [player] on collision.
///A [BoostPlatform] has a [jumpFactor] it gives the [player] on collision.
///A [BoostPlatform] is either visited or not.
///A [BoostPlatform] has a [Hitbox].
class BoostPlatform extends Platform {

  ///Constructor to create a [BoostPlatform] object for a [level].
  ///[BoostPlatform] is positioned in the given coordinates and the given dimension, with the given ID.
  ///[BoostPlatform] gets the types: Platform, boostPlatform and 0 protection and 0 damage. It's jump factor is twice a standard jump
  BoostPlatform(id, xPos, yPos, xDim, yDim)
      : super(id, ["platform", "boostPlatform"], xPos, yPos, xDim, yDim, 0, 0,
      stdJump * 2);

  ///Constructor to create a [BoostPlatform] object for a [level], from a json String
  ///Sets the given ID and takes the position and dimension information from the json element.
  ///[BoostPlatform] gets the types: Platform, boostPlatform and 0 protection and 0 damage. It's jump factor is twice a standard jump
  BoostPlatform.fromJson(int id, Map<String, dynamic> json)
      : super(
      id,
      ["platform", "boostPlatform"],
      json["xPos"],
      json["yPos"],
      json["xDim"],
      json["yDim"],
      0,
      0,
      (stdJump * 1.2));
}
