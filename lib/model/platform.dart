import 'package:jumpdx9001deluxe/model/game_element.dart';


///Defines a [Platform] of the [level].
///A [Platform] has a [id] for refernce.
///A [Platform] has [types] for its appearance.
///A [Platform] has a [xPosition].
///A [Platform] has a [yPosition].
///A [Platform] has a [xSize].
///A [Platform] has a [ySize].
///A [Platform] has a [damage] it causes to the [player] on collision.
///A [Platform] has a [protection] protection it gives the [player] on collision.
///A [Platform] has a [jumpFactor] it gives the [player] on collision.
///A [Platform] is either visited or not.
///A [Platform] has a [Hitbox].
abstract class Platform extends GameElement {

  bool visited = false;
  double jumpFactor;
  int damage;
  int protection;

  ///Constructor to create a [Platform] object for a [level].
  ///[Platform] is positioned in the given coordinates and the given dimension, with the given ID.
  ///[Platform] gets the types: Platform, boostPlatform and 0 protection and 0 damage. It's jump factor is twice a standard jump
  Platform(int id, List<String> types, xPos, yPos, xDim, yDim, this.damage,
      this.protection, this.jumpFactor)
      : super(id, types, xPos, yPos, xDim, yDim);

  ///Sets the platform to used.
  void onVisit() {
    visited = true;
  }
}
