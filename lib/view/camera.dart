import 'dart:html';
import 'dart:math';

import 'package:jumpdx9001deluxe/model/game_element.dart';

class Camera {

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


  double cameraRatio;
  double cameraYPosition = 0;

  // no need for an x Anchoring yet
  // double cameraXPosition;
  int cameraHeight;
  int cameraWidth;
  Map<int, Element> scene = Map();

  // querySelector for Stage
  final stage = querySelector("#stage");

  /// Constructor
  Camera(this.cameraHeight, this.cameraWidth) {
    this.cameraRatio = cameraHeight / cameraWidth;
  }

  num get cameraTopBorder => cameraYPosition + cameraRatio / 2;

  num get cameraBottomBorder => cameraYPosition - cameraRatio / 2;

  /// locks on GameElement
  void lockGameElement(GameElement e) {
    cameraYPosition = e.yPosition;
  }

  /// locks on MaxHeight
  void lockHeight(GameElement e) {
    cameraYPosition = max(cameraYPosition, e.yPosition);
  }

  /// updates seenElements
  void update(List<GameElement> entities) {
    f1.text = cameraTopBorder.toString();
    f2.text = cameraYPosition.toString();
    f3.text = cameraBottomBorder.toString();
    entities
        .where((e) =>
           (e.yPosition < cameraTopBorder && e.yPosition > cameraBottomBorder))
        .forEach(renderElement);
  }

  renderElement(GameElement e) {
    // creates a div
    Element div = Element.div();
    // adds it to the scene if absent
    if(!scene.containsKey(e.id)){
      //sets classes
      div.classes = e.types;
      scene.putIfAbsent(e.id, () => div);
    }
    else{
      div = scene[e.id];
    }


    // updates its values

    div.text = "X:" + e.xPosition.toString() + "Y:" + e.yPosition.toString();
    // Viewport relativ
    div.style.left = (e.xPosition * 100).toString() + "%";
    div.style.bottom =
        ((e.yPosition - cameraYPosition) * 100 / cameraRatio).toString() + "%";
    div.style.width = (e.xSize * 100).toString() + "%";
    div.style.height = (e.ySize * 100 / cameraRatio).toString() + "%";

    // inserts it in dom
    stage.insertAdjacentElement("afterBegin", div);

  }
}
