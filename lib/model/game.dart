import 'package:jumpdx9001deluxe/model/level.dart';

class Game {
  Level level;
  List<int> highscore;
  int state;
  int levelID;

  Game() {
    this.level = new Level();
  }
  // this is needed for smooth movement
  // and collision and so on
  // add the functionality to let the model calculate at a certain tick rate
  update(){
    // inclusive player
    level.updateEntities();
  }
  bool newGame() {}

  void nextLevel(int levelID) {}


  // entrypoint for actionlistener
  void acceleratePlayer(double dx,double dy) {
    level.player.accelerate(dx, dy);
  }

  // entrypoint for view
  get entities => level.map;
}
