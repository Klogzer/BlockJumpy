import 'dart:html';

import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/level.dart';

class View {
  /// Viewport size
  int screenHeight = window.innerHeight;
  int screenWidth = window.innerWidth;

  Game game;

  View(this.game);

  // MockGameOver
  bool end = false;

  // Map to handle its Elements
  Map<int, Element> domMap = Map();

  // querySelector for Stage
  final stage = querySelector("#stage");

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

  // querySelector for Stage
  final score = querySelector("#score");

  // querySelector for jsonButton
  final levelOne = querySelector("#level1");

  // querySelector for jsonButton
  final levelFromTextarea = querySelector("#levelFromTextarea");

  // querySelector for overlay
  final overlay = querySelector("#overlay");

  /// inserts GameElement into DOM
  /// keeps track of it
  /// updates it
  ///
  /*
  void update() {
    //if gameover
    if (end) {
      stage.style.display = "none";
      menu.style.display = "block";
    }

    //score.text = game.level.player.getScoreAsText;

    Element vElement = Element.div();
    for (GameElement e in game.entities) {
      // creates en element if it is not in the map yet
      if (!domMap.containsKey(e.id)) {
        vElement.classes = e.types;
        vElement.style.position = "absolute";
        stage.insertAdjacentElement("afterBegin", vElement);
        domMap.putIfAbsent(e.id, () => vElement);
      }
      // get the element in the map
      else {
        vElement = domMap[e.id];
      }
      // todo implement hidden display:none if not in stage
      // updates DOM according to the model
      updateElement(vElement, e);
    }
  }
   */
  void update() {
    double modelRatio = 34;
    double cameraRatio = screenHeight / screenWidth;

    /// camera 0-1 tagged to the player run height
    double cameraPosition = game.level.player.hight;
    double cameraTopBorder = cameraPosition + screenHeight / 2;
    double cameraBottomBorder = cameraPosition - screenHeight / 2;
    Element vElement;
    for (GameElement e in game.entities) {
      // check for viewport/camera
      // determins if the object is in the viewport
      //if(e.yPosition >= cameraBottomBorder && e.yPosition <= cameraTopBorder)  {
      if (!domMap.containsKey(e.id)) {
        vElement = Element.div();
        vElement.classes = e.types;
        vElement.style.position = "absolute";
        stage.insertAdjacentElement("afterBegin", vElement);
        domMap.putIfAbsent(e.id, () => vElement);
      } else {
        vElement = domMap[e.id];
      }
      //print("X:" + e.xPosition.toString() + "Y:" + e.yPosition.toString());
      updateElement(vElement, e);

      //}

    }
  }

  void drawGameStage() {
    // removes all Elements from map
    domMap.clear();
    //mainContainer.style.width = StageXDimension.toString() + "px";
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

  updateElement(Element vElement, GameElement e) {
    double modelratio = game.level.hight;
    // Viewport relativ
    vElement.style.left = (e.xPosition * 100).toString() + "%";
    vElement.style.bottom = (e.yPosition * modelratio * 100).toString() + "%";
    vElement.style.width = (e.xSize * 100).toString() + "%";
    vElement.style.height = (e.ySize * modelratio * 100).toString() + "%";
  }
}
