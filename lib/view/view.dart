import 'dart:html';
import 'dart:math';

import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';
import 'package:jumpdx9001deluxe/model/level.dart';

class View {
  /// Viewport size
  int screenHeight = window.innerHeight;
  int screenWidth = window.innerWidth;
  double cameraRatio;
  double cameraPosition = 0;
  Game game;

  View(this.game){
    cameraRatio = screenHeight / screenWidth;
  }

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



  /// Debugg
  ///
  ///
  // querySelector for overlay
  final f1 = querySelector("#cposition");
  // querySelector for overlay
  final f2 = querySelector("#ctopBorder");
  // querySelector for overlay
  final f3 = querySelector("#cbottomBorder");
  // querySelector for overlay
  final f4 = querySelector("#playerpos");


  ///
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



    /// camera 0-1 tagged to the player run height

    cameraPosition= max(cameraPosition , game.level.player.hight - cameraRatio / 2);
    double cameraTopBorder = cameraPosition + cameraRatio;
    double cameraBottomBorder = cameraPosition - cameraRatio / 2;
    f1.text = cameraPosition.toString();
    f2.text = cameraTopBorder.toString();
    f3.text = cameraBottomBorder.toString();

    Element vElement;
    for (GameElement e in game.entities) {
      if (!domMap.containsKey(e.id)) {
        vElement = Element.div();
        vElement.classes = e.types;
        vElement.style.position = "absolute";

        stage.insertAdjacentElement("afterBegin", vElement);
        domMap.putIfAbsent(e.id, () => vElement);
      } else {
        vElement = domMap[e.id];
      }
      // check for viewport/camera
      // determins if the object is in the viewport
      if(e.yPosition >= cameraBottomBorder && e.yPosition <= cameraTopBorder)  {
        vElement.style.display = "block";
      //print("X:" + e.xPosition.toString() + "Y:" + e.yPosition.toString());
      updateElement(vElement, e);
      }
      else{
        // isnt in the viewport doesnt need to be displayed
        vElement.remove();
        domMap.remove(e.id);
      }

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
    vElement.text =  "X:"+ e.xPosition.toString() + "Y:" +e.yPosition.toString();
    // Viewport relativ
    vElement.style.left = (e.xPosition * 100).toString() + "%";
    vElement.style.bottom = ((e.yPosition -cameraPosition) * 100 /cameraRatio ).toString() + "%";
    vElement.style.width = (e.xSize * 100).toString() + "%";
    vElement.style.height = (e.ySize * 100 /cameraRatio).toString() + "%";
  }
  moveCamera(){

  }
}
