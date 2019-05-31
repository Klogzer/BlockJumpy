import 'dart:html';

import 'package:jumpdx9001deluxe/model/game_element.dart';

class View {
  /// Viewport size
  int screenHeight = window.innerHeight;
  int screenWidth = window.innerWidth;


  var game;
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

  // querySelector for menuButton
  final menuBtn = querySelector("#menu-btn");

  // querySelector for jsonButton
  final levelOne = querySelector("#level1");

  // querySelector for jsonButton
  final levelFromTextarea = querySelector("#levelFromTextarea");

  // querySelector for overlay
  final overlay = querySelector("#overlay");

  /// inserts GameElement into DOM
  /// keeps track of it
  /// updates it
  void update() {
    //if gameover
    if (end) {
      stage.style.display = "none";
      menu.style.display = "block";
    }

    score.text = game.level.player.getScoreAsText;

    Element vElement;
    for (GameElement e in game.entities) {
      // creates en element if it is not in the map yet
      if (!domMap.containsKey(e.id)) {
        vElement = Element.div();
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
      updateElement(vElement,e);
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

  updateElement(Element vElement ,GameElement e){
  vElement.style.left = (0.1*100).toString() + "%";
  vElement.style.bottom = (0.1*100).toString() + "%";
  vElement.style.width = (0.1*100).toString() + "%";
  vElement.style.height = (0.1*100).toString() + "%";
  }

}
