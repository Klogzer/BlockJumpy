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
      view.drawGameStage();
      //start game
      startGame();
    });

    ///resume button
    view.resumeBtn.onClick.listen((_) {
      view.drawGameStage();
      // start game with default level
      startGame();
    });

    view.overlay.onClick.listen((_) {
      pauseGame();
      view.drawPauseMenu();
    });

    view.back.onClick.listen((_) {
      view.drawMainMenu();
    });

    ///actionlistener for levelbuttons
    view.levelOne.onClick.listen((_) async {
      await startLevel(1);
    });
    view.levelTwo.onClick.listen((_) async {
      await startLevel(2);
    });
    view.levelThree.onClick.listen((_) async {
      await startLevel(3);
    });
    view.levelFour.onClick.listen((_) async {
      await startLevel(4);
    });
    view.levelFive.onClick.listen((_) async {
      await startLevel(5);
    });

    /// Menu
    view.levelSel.onClick.listen((_) {
      view.drawLevelMenu();
    });

    view.creditsBtn.onClick.listen((_) {
      view.drawCredits();
    });

    view.credits.onClick.listen((_) {
      view.drawMainMenu();
    });

    view.howto.onClick.listen((_) {
      view.drawMainMenu();
    });

    view.howtoBtn.onClick.listen((_) {
      view.drawHowToScreen();
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
          game.acceleratePlayer(-0.5, 0);
          break;
        case KeyCode.RIGHT:
          game.acceleratePlayer(0.5, 0);
          break;
        case KeyCode.N:
          pauseGame();
          break;
        case KeyCode.M:
          startGame();
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
        //print(dx);
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
  /// 144hz heist für das modell eine Höchsgeschwindigkeit von 144 Ticks pro Sekunde.
  startModel() {
    int tick = (1000 / tickModel).floor();
    Duration duration = Duration(milliseconds: tick);
    _modelTimer = Timer.periodic(
        duration,
        (Timer t) => {
              (game.level.player.getStatus()['Alive'] as double >= 1.0)
                  ? (game.level.won)
                      ? {_modelTimer.cancel(), startNextLevel()}
                      : game.update()
                  : {_modelTimer.cancel(), view.drawEndScreen()}
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

  startLevel(int lvl) async {
    await HttpRequest.getString("level/level" + lvl.toString() + ".json")
        .then((myjson) {
      Map data = json.decode(myjson);
      // update level from json
      game.level = Level.fromJson(data);
      game.secondaryScore = 0;
      // startGame with the updated level
      view.drawGameStage();
      view.drawStartMenu();
    });
  }

  startNextLevel() async {
    await HttpRequest.getString(
            "level/level" + game.levelID.toString() + ".json")
        .then((myjson) {
      Map data = json.decode(myjson);
      // update level from json
      game.level = Level.fromJson(data);
      // startGame with the updated level
      view.drawGameStage();
      view.drawStartMenu();
    });
  }
}
