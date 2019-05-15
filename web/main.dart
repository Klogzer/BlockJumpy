import 'dart:html';

import 'package:jumpdx9001deluxe/model/game.dart';

import 'controller.dart';
import 'view.dart';

void main() {
  Game game = Game();
  View view = View();
  Controller con = Controller(view,game);
}
