import 'dart:async';
import 'dart:html';

import 'dart:math';

import 'package:jumpdx9001deluxe/model/game.dart';

import 'view.dart';

class Controller {
  // physix and stuff
  // View
  // model
  bool end = false;

  Game game;

  View view;

  // Timer etc
  Controller(this.view, this.game) {
    view.prepareGameStage(game);
    // Keyboard eventlistening
    window.onKeyDown.listen((KeyboardEvent ev) {
      if (end) return;
      switch (ev.keyCode) {
        case KeyCode.LEFT:
          print("Left");
          game.movePlayerLeft(2);
          break;
        case KeyCode.RIGHT:
          game.movePlayerRight(2);
          print(game.getElements().first.xPosition);
          print("Right");
          break;
        case KeyCode.UP:
          print("Up");
          break;
        case KeyCode.DOWN:
          print("Down");
          break;
      }
    });

    // Device orientation event handler.
    //
    window.onDeviceOrientation.listen((ev) {
      // No device orientation
      if (ev.alpha == null && ev.beta == null && ev.gamma == null) {
        // no deviceorientation found do something here
      }
      // Device orientation available
      else {
        // movement from orientation event
        //
        // beta: 30° no move, 10° full up, 50° full down
        // gamma: 0° no move, -20° full left, 20° full right
        //
        final dy = min(50, max(10, ev.beta)) - 30;
        final dx = min(20, max(-20, ev.gamma));
        print(dx.toString() + "|dx " + dy.toString() + "|dy");
      }
    });
    startRender();
  }
  // initialisierung des RenderTimers
  startRender() {
    int refreshRate = (1000/30).floor();
    Duration duration = Duration(milliseconds: refreshRate);
    return new Timer.periodic(duration, (Timer t) => view.update(game));
  }
}
