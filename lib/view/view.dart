import 'dart:html';
import 'dart:math';

import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/view/camera.dart';

class View {
  /// Viewport size
  int screenHeight = window.innerHeight;
  int screenWidth = window.innerWidth;
  Game game;
  Camera camera;


  // Map with all Elements displayed in #stage
  Map<int, Element> domMap = Map();

  View(this.game) {
    window.screen.orientation.lock("landsscape-primary");
    this.camera = Camera(screenHeight,min(screenWidth,1000));
  }

  // MockGameOver
  bool end = false;

  // querySelector for Stage
  final stage = querySelector("#stage");

  // querySelector for level
  final level = querySelector("#level");
  // querySelector for score
  final score = querySelector("#score");
  // querySelector for highscore
  final highscore = querySelector("#highscore");

  // querySelector for menu
  final menu = querySelector("#menu");

  // querySelector for start
  final start = querySelector("#start");

  // querySelector for resumeBtn
  final resumeBtn = querySelector("#resum");

  // querySelector for gameContainer
  final mainContainer = querySelector("#mainContainer");

  // querySelector for textArea
  final textArea = querySelector("#textArea") as TextAreaElement;



  // querySelector for jsonButton
  final levelOne = querySelector("#level1");

  // querySelector for jsonButton
  final levelFromTextarea = querySelector("#levelFromTextarea");

  // querySelector for overlay
  final overlay = querySelector("#overlay");



  /// DOM manipulation
  /// add Elements according to Level
  /// inserts Element into (#stage) if not already there
  /// updates it
  ///
  void update() {
    score.text = game.level.player.score.toString();
    level.text = game.levelID.toString();
    highscore.text = game.highscore.toString();

    camera.lockGameElement(game.level.player);
    camera.update(game.entities);
  }

  void drawGameStage() {
    // emptys stage div
    stage.innerHtml = "";
    menu.style.display = "none";
    stage.style.display = "block";
    overlay.style.display = "block";
  }

  drawPauseMenu() {
    //mainContainer.style.width = "100%";
    menu.style.display = "block";
    stage.style.display = "none";
    start.text = "Resume";
    overlay.style.display = "none";
  }
}
