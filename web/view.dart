import 'dart:html';

import 'package:jumpdx9001deluxe/model/game.dart';

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

  // querySelector for Stage
  final score = querySelector("#score");

  // querySelector for jsonButton
  final jsonbutton = querySelector("#json");

  void update(Game game) {
    //if gameover
    if (end) {
      gameContainer.style.display = "none";
      menu.style.display = "block";
    }
    //score.text = game.level.player.score;
    Element viewElement;
    game.entities.forEach( (currentEntity)=> {
              //print(currentEntity.xPosition.round.toString()),
              viewElement = domMap[currentEntity.id],
              //print(viewElement.classes.toString()),
              viewElement.style.bottom =
                  currentEntity.yPosition.round().toString() + "px",
              viewElement.style.left =
                  currentEntity.xPosition.round().toString() + "px",
            });
  }

  void prepareGameStage(Game game) {
    // removes all Element from map
    domMap.clear();
    // emptys stage div
    stage.innerHtml = "";

    // resets mock gameover
    end = false;

    menu.style.display = "none";
    gameContainer.style.display = "block";
    Element viewElement;
    game.entities.forEach((entity) => {
          viewElement = Element.div(),
          viewElement.classes = entity.types,
          // set according to Model
          viewElement.style.left = entity.xPosition.round().toString() + "px",
          viewElement.style.bottom = entity.yPosition.round().toString() + "px",
          viewElement.style.position = "absolute",
          stage.insertAdjacentElement("afterBegin", viewElement),
          // put in the map to call it later without the hazzle to get a real css id
          domMap.putIfAbsent(entity.id, () => viewElement)
        });
  }
}
