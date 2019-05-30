import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/view/view.dart';

class Controller {
  // physix and stuff
  // View
  // model
  bool end = false;
  Timer _viewTimer;
  Timer _modelTimer;

  Game game;

  View view;

  // Timer etc
  Controller(this.view, this.game) {
    // New game is started by user
    view.start.onClick.listen((_) {
      startGame(game);
    });

    view.levelOne.onClick.listen((_) async {
      await HttpRequest.getString('level/level1.json').then((myjson) {
        Map data = json.decode(myjson);
        game.level = Level.fromJson(data);
        startGame(game);
      });
    });

    view.levelTwo.onClick.listen((_) async {
      Map data = json.decode(view.textArea.value);
      game.level = Level.fromJson(data);
      view.prepareGameStage(game);
      view.mainContainer.style.width = StageXDimension.toString() + "px";
      _modelTimer = startModel();
      _viewTimer = startView();
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

        final dx = (gamma.abs() > DEADZONE)
            ? ((gamma.abs() > range)
                ? ((gamma.isNegative) ? -range : range)
                : gamma)
            : 0;

        // normalize
        print((dx / range).toString() + ":dx");
        game.acceleratePlayer(dx / range, 0);
      }
    });
  }

  // initialisierung des RenderTimers
  // eigentlich kein bedarf die wiederholungrate höher zu haben als das model rechnet
  startView() {
    int refreshRate = (1000 / fps).floor();
    Duration duration = Duration(milliseconds: refreshRate);
    _viewTimer = Timer.periodic(
        duration,
        (Timer t) => {
              view.update(game),
              // ending condition
              //(game.getElements().first.xPosition >= 100) ? t.cancel() : null,
            });
  }

  void startGame(game) {
    view.prepareGameStage(game);
    startModel();
    startView();
  }

  // die Anzahl an ticks des modells
  // 144hz heist für das modell eine Höchsgeschwindigkeit von 144pixeln pro sekunde
  startModel() {
    int tick = (1000 / tickModel).floor();
    Duration duration = Duration(milliseconds: tick);
    _modelTimer = Timer.periodic(
        duration,
        (Timer t) => {
              game.update(),
              // ending condition
              //(game.getElements().first.xPosition >= 100) ? t.cancel() : null,
            });
  }

  // called for pausing the model
  // game is able to be paused
  pause() {
    _modelTimer.cancel();
    _viewTimer.cancel();
  }
  // called when resuming, necessity unknown
  resume(){
    startModel();
    startView();
  }
}
