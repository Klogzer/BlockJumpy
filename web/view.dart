import 'dart:html';

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



  void update(Game game) {
    //if gameover
    if(end){
      gameContainer.style.display = "none";
      menu.style.display = "block";
    }
    String left;
    String bottom;
    Element viewElement;
    game.getElements().forEach((currentEntity) => {
          viewElement = domMap[currentEntity.id],
          viewElement.style.bottom = currentEntity.yPosition.toString() + "px",
          viewElement.style.left = currentEntity.xPosition.toString() + "px",
        });
  }

  void prepareGameStage(Game game) {
    // removes all Element from map
    domMap.clear();
    // emptys stage div
    stage.innerHtml ="";

    // resets mock gameover
    end = false;


    menu.style.display = "none";
    gameContainer.style.display="block";
    Element viewElement;
    int i = 1;
    game.getElements().forEach((entity) => {
          viewElement = Element.div(),
          viewElement.classes.add(entity.type),
          // set according to Model
          print(entity.xPosition),
          viewElement.style.left = entity.xPosition.toString() + "px",
          viewElement.style.bottom = entity.yPosition.toString() + "px",
          viewElement.style.position = "absolute",
          i++,
          stage.insertAdjacentElement("afterBegin", viewElement),
          // put in the map to call it later without the hazzle to get a real css id
          domMap.putIfAbsent(entity.id, () => viewElement)
        });
    /*
        <img class="platform normalPlatform" id="1" style="left: 200px; bottom: 100px">
        <img class="platform boostPlatform" id="2" style="left: 50px; bottom: 200px">
        <img class="platform deadlyPlatform" id="3" style="left: 80px; bottom: 300px">
        <img class="platform protectionPlatform" id="4" style="left: 350px; bottom: 400px">
        <img class="platform oneTimePlatform" id="5" style="left: 120px; bottom: 500px">        
     */
  }
}
