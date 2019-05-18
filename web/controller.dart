import 'dart:async';
import 'dart:html';

import 'dart:math';

import 'package:jumpdx9001deluxe/model/game.dart';

import 'view.dart';
import 'package:jumpdx9001deluxe/constants.dart';


class Controller {
  // physix and stuff
  // View
  // model
  bool end = false;
  Timer viewTimer;
  Timer modelTimer;

  Game game;

  View view;

  // Timer etc
  Controller(this.view, this.game) {
    // New game is started by user
    view.start.onClick.listen((_) {
      view.prepareGameStage(game);
      modelTimer = updateModel();
      viewTimer = updateView();
    });

    // Keyboard eventlistening
    window.onKeyDown.listen((KeyboardEvent ev) {
      if (end) return;
      switch (ev.keyCode) {
        case KeyCode.LEFT:
          print("Left");
          game.acceleratePlayer(-1, 0);
          break;
        case KeyCode.RIGHT:
          game.acceleratePlayer(1, 0);
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
    // Keyboard eventlistening
    window.onKeyUp.listen((KeyboardEvent ev) {
      if (end) return;
      switch (ev.keyCode) {
        case KeyCode.LEFT:
          print("Left");
          game.acceleratePlayer(0, 0);
          break;
        case KeyCode.RIGHT:
          game.acceleratePlayer(0, 0);
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
        game.acceleratePlayer(dx, dy);
      }
    });
  }

  // initialisierung des RenderTimers
  // eigentlich kein bedarf die wiederholungrate höher zu haben als das model rechnet
  updateView() {
    int refreshRate = (1000 / fps).floor();
    Duration duration = Duration(milliseconds: refreshRate);
    return new Timer.periodic(
        duration,
        (Timer t) => {
              view.update(game),
              // ending condition
              //(game.getElements().first.xPosition >= 100) ? t.cancel() : null,
            });
  }
  // die Anzahl an ticks des modells
  // 144hz heist für das modell eine Höchsgeschwindigkeit von 144pixeln pro sekunde
  updateModel() {
    int tick = (1000 / tickModel).floor();
    Duration duration = Duration(milliseconds: tick);
    return new Timer.periodic(
        duration,
            (Timer t) => {
          game.update(),
          // ending condition
          //(game.getElements().first.xPosition >= 100) ? t.cancel() : null,
        });
  }
  stopGameByTimer() {
    Duration duration = Duration(seconds: 10);
    return new Timer(duration, () => {view.end = true, print("end")});
  }
}
