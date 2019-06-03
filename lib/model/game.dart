import 'package:jumpdx9001deluxe/model/level.dart';

class Game {
  Level _level;
  int _highscore = 0;
  int _secondaryScore = 0;
  int _levelID;

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
    if (_secondaryScore + level.player.score > highscore) {
      highscore = _secondaryScore + level.player.score;
    }
    level.update();
    if(level.won) nextLevel();
  }

  void nextLevel() {
    _secondaryScore += level.player.score;
    levelID++;
    level.won = true;
  }

// entrypoint for actionlistener
  void acceleratePlayer(double dx, double dy) {
    level.player.accelerate(dx, dy);
  }

// entrypoint for view
  get entities => level.entities;

  int get levelID => _levelID;

  set levelID(int value) {
    _levelID = value;
  }

  int get highscore => _highscore;

  set highscore(int value) {
    _highscore = value;
  }

  Level get level => _level;

  set level(Level value) {
    _level = value;
  }

  int get secondaryScore => _secondaryScore;

  set secondaryScore(int value) {
    _secondaryScore = value;
  }
}
