import 'GameElement.dart';
import 'PositionObject.dart';
import 'SizeObject.dart';
import 'LivingObject.dart';
import 'DynamicObject.dart';

class Player extends GameElement with PositionObject, SizeObject, LivingObject, DynamicObject{

  int score;
  int jumps;
  int visits;
  int height;

  Player(int id) : super(id) {

  }

  void newJump(int speed, bool newPlatform) {

  }

  int getScore() {

    return score;

  }

  void setScore(int score) {

    this.score = score;

  }

  int getJumps() {

    return jumps;

  }

  void setJumps(int jumps) {

    this.jumps = jumps;

  }

  int getVisits() {

    return visits;

  }

  void setVisits(int visits) {

    this.visits = visits;

  }

  int getHeight() {

    return height;

  }

  void setHeight() {

    this.height = height;

  }

}