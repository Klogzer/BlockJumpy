///Author: Milan Stuhlsatz

import 'package:jumpdx9001deluxe/model/level.dart';

class Game {
  Level level;
  int highscore = 0;
  int secondaryScore = 0;
  int levelID;

  Game() {
    levelID = 1;

    this.level = new Level();
  }

  // this is needed for smooth movement
  // and collision and so on
  // add the functionality to let the model calculate at a certain tick rate
  update() {
    // inclusive player
    level.updateEntities();
    if (secondaryScore + level.player.score > highscore) {
      highscore = secondaryScore + level.player.score;
    }
    level.update();
    if(level.won) nextLevel();
  }

  void nextLevel() {
    secondaryScore += level.player.score;
    levelID++;
    level.won = true;
  }

// entrypoint for actionlistener
  void acceleratePlayer(double dx, double dy) {
    if(level.player != null){
      level.player.accelerate(dx, dy);
    }
  }

// entrypoint for view
  get entities => level.entities;
}
