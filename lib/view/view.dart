import 'dart:html';

import 'package:jumpdx9001deluxe/constants.dart';
import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';

class View {
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

  // querySelector for gameContainer
  final gameContainer = querySelector("#gameContainer");

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
  final levelTwo = querySelector("#level2");


  /// inserts GameElement into DOM
  /// keeps track of it
  /// updates it
  void update(Game game) {
    //if gameover
    if (end) {
      gameContainer.style.display = "none";
      menu.style.display = "block";
    }

    score.text = game.level.player.getScoreAsText;

    Element viewElement;
    for (GameElement e in game.entities) {
      // creates en element if it is not in the map yet
      if (!domMap.containsKey(e.id)) {
        viewElement = Element.div();
        viewElement.classes = e.types;
        stage.insertAdjacentElement("afterBegin", viewElement);
        domMap.putIfAbsent(e.id, () => viewElement);
      }
      // get the element in the map
      else{
        viewElement = domMap[e.id];
      }
      // todo implement hidden display:none if not in stage
      // updates DOM according to the model
      viewElement.style.left = e.xPosition.round().toString() + "px";
      viewElement.style.bottom = e.yPosition.round().toString() + "px";
      viewElement.style.width = e.xSize.round().toString() + "px";
      viewElement.style.height = e.ySize.round().toString() + "px";
      viewElement.style.position = "absolute";

    }
  }

  void prepareGameStage(Game game) {
    // removes all Element from map
    mainContainer.style.width = StageXDimension.toString() + "px";
    domMap.clear();
    // emptys stage div
    stage.innerHtml = "";
    menu.style.display = "none";
    gameContainer.style.display = "block";
  }
}
