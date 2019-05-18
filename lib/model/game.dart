import 'package:jumpdx9001deluxe/model/game_element.dart';
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
    // everyThing moves by its velocity
    // foreach entity.moveBy(velocity);
    print(level.player.xPosition.toString());
    level.moveEntities();
  }
  bool newGame() {}

  void nextLevel(int levelID) {}

  void acceleratePlayer(double dx,double dy) {
    level.player.accelerate(dx, dy);
  }


  get elements => level.entities;
}
