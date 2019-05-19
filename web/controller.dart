import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'dart:math';

import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/model/level.dart';

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

    view.jsonbutton.onClick.listen((_) {
      //game.level = Level.fromJson("str");
      //game.level = Level.fromJson("str");
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
        var gamma = ev.gamma;
        // DEADZONE
        final int DEADZONE = 2;
        // tilt for max acceleration
        int range = 30;

        final dx = (gamma > DEADZONE || gamma < -DEADZONE)
            ? ((gamma > range || gamma < -range)
            ? ((gamma.isNegative) ? -range : range)
            : gamma)
            : 0;

        // normalize
        print((dx/range).toString() +":dx");
        game.acceleratePlayer(dx / range, 0);
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
