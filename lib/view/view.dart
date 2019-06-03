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
    this.camera = Camera(screenHeight, min(screenWidth, 1000));
  }

  // MockGameOver
  bool end = false;

  // querySelector for gameContainer
  final mainContainer = querySelector("#mainContainer");

  // querySelector for Stage
  final stage = querySelector("#stage");

  /// overlay ///
  ///
  ///
  // querySelector for level
  final level = querySelector("#level");

  // querySelector for score
  final score = querySelector("#score");

  // querySelector for highscore
  final highscore = querySelector("#highscore");

  // querySelector for overlay
  final overlay = querySelector("#overlay");

  /// Overlay end

  /// Menu
  ///
  ///
  ///
  // querySelector for menu
  final menu = querySelector("#menu");

  //querySelector for resumeBtn
  final resumeBtn = querySelector("#resume");

  // querySelector for levelSelector 1
  final levelSel = querySelector("#levelSel");

  // querySelector for textArea
  final textArea = querySelector("#textArea") as TextAreaElement;

  // querySelector for levelFromTextarea
  final levelFromTextarea = querySelector("#levelFromTextarea");

  // querySelector for target
  final target = querySelector("#target");

  // querySelector for jsonButton
  final reason = querySelector("#reason");

  // querySelector for howtoBtn
  final howtoBtn = querySelector("#howtoBtn");

  // querySelector for howto
  final howto = querySelector("#howTo");

  // querySelector for creditsBtn
  final creditsBtn = querySelector("#creditsBtn");

  // querySelector for credits
  final credits = querySelector("#credits");

  // querySelector for objectives
  final objectives = querySelector("#objectives");

  /// Menu End

  /// Levelmenu
  ///
  ///
  // querySelecotr for levels
  final levels = querySelector("#levels");

  // querySelector for level
  final levelOne = querySelector("#levelOne");

  // querySelector for level
  final levelTwo = querySelector("#levelTwo");

  // querySelector for level
  final levelThree = querySelector("#levelThree");

  // querySelector for level
  final levelFour = querySelector("#levelFour");

  // querySelector for level
  final levelFive = querySelector("#levelFive");

  // querySelector for level
  final back = querySelector("#back");

  /// Levelmenu end

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
    levels.style.display = "none";
    stage.style.display = "block";
    overlay.style.display = "block";
  }

  void drawMainMenu() {
    levels.style.display = "none";
    menu.style.display = "block";
    stage.style.display = "none";
    overlay.style.display = "none";
    howto.style.display = "none";
    credits.style.display = "none";
  }

  void drawLevelMenu() {
    levels.style.display = "block";
    menu.style.display = "none";
    stage.style.display = "none";
    overlay.style.display = "none";
  }

  void drawPauseMenu() {
    updateObjectiveTable("Paused");
    resumeBtn.style.display = "block";
    levels.style.display = "none";
    menu.style.display = "block";
    target.style.display = "block";
    stage.style.display = "none";
    overlay.style.display = "none";
  }

  void updateObjectiveTable(String s) {
    objectives.innerHtml = "";
    reason.text = s;
    Map<String, List<int>> map = Map();
    game.level.getWinCondition().forEach((k, v) => {
          v != 0
              ? map.putIfAbsent(k, () => [v, game.level.player.getStatus()[k]])
              : null,
        });

    // erstelle für alles TabellenEinträge
    objectives.insertAdjacentHtml(
        "afterBegin",
        "<tr>" +
            "<td>Category </td>" +
            "<td> Target </td>" +
            "<td> Current</td>" +
            "</tr>");
    map.forEach((label, list) => objectives.insertAdjacentHtml(
        "beforeEnd",
        "<tr><td>$label</td><td>" +
            list[0].toString() +
            "</td><td>" +
            list[1].toString() +
            "</td></tr>"));
  }

  drawEndScreen() {
    updateObjectiveTable(
        "Well, this isn't DARK SOULS, but you died anyways...");
    resumeBtn.style.display = "none";
    levels.style.display = "none";
    menu.style.display = "block";
    target.style.display = "block";
    stage.style.display = "none";
    overlay.style.display = "none";
  }

  drawHowToScreen() {
    howto.style.display = "block";
    menu.style.display = "none";
  }

  drawCredits() {
    credits.style.display = "block";
    menu.style.display = "none";
  }

  void drawStartMenu() {
    updateObjectiveTable(
        "New Level, please click Resume to begin... if you dare!");
    resumeBtn.style.display = "block";
    levels.style.display = "none";
    menu.style.display = "block";
    target.style.display = "block";
    stage.style.display = "none";
    overlay.style.display = "none";
  }
}
