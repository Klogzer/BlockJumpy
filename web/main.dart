
import 'package:jumpdx9001deluxe/controller/controller.dart';
import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/view/view.dart';

void main() {

  Game game = Game();
  View view = View(game);
  Controller(view,game);
}
