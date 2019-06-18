/// @Author Marius Mauritz
import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/model/level.dart';
import 'package:jumpdx9001deluxe/view/view.dart';

/// A [Controller] object handles several events
/// like buttonpresses on the keyboard or deviceorientation on mobile
///
/// [View] and [Game] are updated by timers
class Controller {
  /// Periodic timer updating the view
  Timer _viewTimer;

  /// Periodic timer updating the game/model
  Timer _modelTimer;

  /// reference to game/model
  Game game;

  /// refence to view
  final View view;

  /// Constructor to create and [Controller] object
  /// Registers all event handlers
  /// used to interact with game
  /// updates view accordingly
  Controller(this.view, this.game) {
    /// Actionlistener for buttons in menu
    ///
    /// loads a level from a hidden textbox
    view.levelFromTextarea.onClick.listen((_) async {
      // load json from textfield
      Map data = json.decode(view.textArea.value);
      // update level from json
      game.level = Level.fromJson(data);
      game.levelID = 1;
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

    /// pause button
    view.overlay.onClick.listen((_) {
      pauseGame();
      view.drawPauseMenu();
    });

    /// eventhandler to draw mainmenu
    view.back.onClick.listen((_) {
      view.drawMainMenu();
    });
    view.credits.onClick.listen((_) {
      view.drawMainMenu();
    });
    view.howto.onClick.listen((_) {
      view.drawMainMenu();
    });

    /// eventhandler to draw level selection
    view.levelSel.onClick.listen((_) {
      view.drawLevelMenu();
    });

    /// eventhandler to draw credits
    view.creditsBtn.onClick.listen((_) {
      view.drawCredits();
    });

    /// eventhandler to draw tutorial
    view.howtoBtn.onClick.listen((_) {
      view.drawHowToScreen();
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
    view.levelSix.onClick.listen((_) async {
      await startLevel(6);
    });
    view.levelSeven.onClick.listen((_) async {
      await startLevel(7);
    });
    view.levelEight.onClick.listen((_) async {
      await startLevel(8);
    });
    view.levelNine.onClick.listen((_) async {
      await startLevel(9);
    });
    view.levelTen.onClick.listen((_) async {
      await startLevel(10);
    });

    ///
    ///
    /// Deviceslistener
    ///
    ///

    /// Keyboard eventlistening
    /// KEYDOWN
    window.onKeyDown.listen((KeyboardEvent ev) {
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

  /// initializes the update timer for [view]
  /// updates the view asynchronous to [game]
  /// the refresh-rate is set in [constants.dart]
  /// if DOM manipulation falls behind the model doesnt slow down
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

  /// initializes the update timer for [game]
  /// updates [model] according to ticks set in [constants.dart]
  /// stops itself if the game is over
  startModel() {
    int tick = (1000 / tickModel).floor();
    Duration duration = Duration(milliseconds: tick);
    _modelTimer = Timer.periodic(
        duration,
        (Timer t) => {
              (game.level.player.getStatus()['Alive'] as double >= 1.0)
                  ? (game.level.won)
                      ? {pauseGame(), startNextLevel()}
                      : game.update()
                  : {pauseGame(), view.drawEndScreen()}
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
    // starts model timer
    startModel();
    // starts view timer
    startView();
  }

  /// loads a level from json
  /// starts
  /// [lvl] parameter is used to load a certain json
  startLevel(int lvl) async {
    await HttpRequest.getString("level/level" + lvl.toString() + ".json")
        .then((myjson) {
      Map data = json.decode(myjson);
      // update level from json
      game.level = Level.fromJson(data);
      game.levelID = lvl;
      game.secondaryScore = 0;
      // startGame with the updated level
      view.drawStartMenu();
    });
  }

  /// loads and starts the next level
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
