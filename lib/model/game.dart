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

  bool newGame() {}

  void nextLevel(int levelID) {}

  void movePlayerRight(double factor) {
    level.movePlayerRight(factor);
  }

  void movePlayerLeft(double factor) {
    level.movePlayerLeft(factor);
  }

  List<GameElement> getElements() {
    List<GameElement> elements = new List();

    elements.add(level.player);

    return elements;
  }
}
