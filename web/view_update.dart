import 'dart:html';
import 'dart:math';
import 'package:demo/model/entities/skateboard.dart';
import 'package:demo/model/world.dart';


class ViewUpdate{


  /**
   * Html element representing the moving area of the game.
   */
  final area = querySelector("#gameStage");

  /**
   * Html element representing the ball of the game.
   */
  final ball = querySelector("#player");

  /**
   * Width of the viewport.
   */
  int get width => window.innerWidth;

  /**
   * Height of the viewport.
   */
  int get height => window.innerHeight;

  /**
   * Size of the viewport (minimum of viewport height and width).
   */
  int get size => min(this.width, this.height);

  /**
   * X position of the viewport center.
   */
  double get center_x => this.width / 2;

  /**
   * Y position of the viewport center.
   */
  double get center_y => this.height / 2;

  /**
   * Updates the viewport according to the circle states of
   * two circles [a] and [b].
   */
  void update(World world) {

    Skateboard b = world.player;
    final round = "${this.size}px";

    this.ball.style.top = "${b.position.y}px";
    this.ball.style.left = "${b.position.x}px";
    this.ball.style.width = "${b.dimension.width}px";
    this.ball.style.height = "${b.dimension.heigth}px";
    this.ball.style.borderRadius=round;
  }

}