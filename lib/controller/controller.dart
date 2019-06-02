import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/view/view.dart';

class Controller {
  /// physix and stuff
  /// View
  /// model
  bool end = false;
  Timer _viewTimer;
  Timer _modelTimer;

  Game game;

  View view;

  // Timer etc
  Controller(this.view, this.game) {
    ///
    ///
    /// Actionlistener for buttons in menu
    ///
    ///

    /// Level 2
    view.levelFromTextarea.onClick.listen((_) async {
      // load json from textfield
      Map data = json.decode(view.textArea.value);
      // update level from json
      game.level = Level.fromJson(data);
      //start game
      startGame();
    });

    ///resume button
    view.resumeBtn.onClick.listen((_) {
      view.drawGameStage();
      // start game with default level
      startGame();
    });

    view.overlay.onClick.listen((_) async {
      pauseGame();
      view.drawPauseMenu();
    });

    view.back.onClick.listen((_) async {
      view.returnToMenu();
    });

    ///actionlistener for levelbuttons
    view.levelOne.onClick.listen((_) async {
     await startLevel("level1");
    });
    view.levelTwo.onClick.listen((_) async {
     await startLevel("level2");
    });
    view.levelThree.onClick.listen((_) async {
     await startLevel("level3");
    });
    view.levelFour.onClick.listen((_) async {
     await startLevel("level1");
    });
    view.levelFive.onClick.listen((_) async {
     await startLevel("level1");
    });

    /// level 1
    view.levelSel.onClick.listen((_) async {
      view.drawLevelMenu();
    });

    ///
    ///
    /// Deviceslistener
    ///
    ///

    /// Keyboard eventlistening
    /// KEYDOWN
    window.onKeyDown.listen((KeyboardEvent ev) {
      if (end) return;
      switch (ev.keyCode) {
        case KeyCode.LEFT:
          game.acceleratePlayer(-1, 0);
          break;
        case KeyCode.RIGHT:
          game.acceleratePlayer(1, 0);
          break;
      }
    });

    /// Keyboard eventlistening
    /// KEYUP
    window.onKeyUp.listen((KeyboardEvent ev) {
      if (end) return;
      switch (ev.keyCode) {
        case KeyCode.LEFT:
          game.acceleratePlayer(0, 0);
          break;
        case KeyCode.RIGHT:
          game.acceleratePlayer(0, 0);
          break;
      }
    });

    /// Device orientation event handler.
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

        // dx is 0 if (2 > gamma > -2)
        // dx is +-30 if (30 < gamma < -30)
        // dx is gamma if (30 >= gamma >= -30)

        final dx = (gamma.abs() > DEADZONE)
            ? ((gamma.abs() > range)
                ? ((gamma.isNegative) ? -range : range)
                : gamma)
            : 0;

        // normalizing dx (1 >= dx >= -1)
        game.acceleratePlayer(dx / range, 0);
      }
    });
  }

  /// initialisierung des RenderTimers
  /// eigentlich kein bedarf die wiederholungrate höher zu haben als das model rechnet
  startView() {
    int refreshRate = (1000 / fps).floor();
    Duration duration = Duration(milliseconds: refreshRate);
    _viewTimer = Timer.periodic(
        duration,
        (Timer t) => {
              view.update(),
              // ending condition
              //(game.getElements().first.xPosition >= 100) ? t.cancel() : null,
            });
  }

  /// die Anzahl an ticks des modells
  /// 144hz heist für das modell eine Höchsgeschwindigkeit von 144pixeln pro sekunde
  startModel() {
    int tick = (1000 / tickModel).floor();
    Duration duration = Duration(milliseconds: tick);
    _modelTimer = Timer.periodic(
        duration,
        (Timer t) => {
              (game.level.player.getStatus()['Alive'] as double >= 1.0)
                  ? game.update()
                  : {_modelTimer.cancel(),view.drawEndScreen()
              }
            });
  }

  /// called for pausing the model
  /// game is able to be paused
  pauseGame() {
    _modelTimer.cancel();
    _viewTimer.cancel();
  }

  /// starts game
  startGame() {
    // updates the model
    startModel();
    // updates DOM
    startView();
  }

  startLevel(String str) async {
    await HttpRequest.getString("level/"+ str +".json").then((myjson) {

      Map data = json.decode(myjson);
      // update level from json
      game.level = Level.fromJson(data);
      // startGame with the updated level
      view.drawGameStage();
      startGame();
    });
  }
}
