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
  double yCenter = 0;

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

  num get cameraTopBorder => yCenter + cameraRatio;

  num get cameraBottomBorder => yCenter - cameraRatio;

  /// locks on GameElement
  void lockGameElement(GameElement e) {
    yCenter = e.yPosition - cameraRatio / 2;
  }

  /// locks on MaxHeight
  void lockHeight(GameElement e) {
    yCenter = max(yCenter, e.yPosition - cameraRatio / 2);
  }

  /// updates seenElements
  void update(List<GameElement> entities) {
    //f1.text = yCenter.toString();
    //f2.text = cameraTopBorder.toString();
    //f3.text = cameraBottomBorder.toString();
    entities.forEach(renderElement);
  }

  renderElement(GameElement e) {
    if (e.yPosition / cameraRatio > cameraBottomBorder && e.yPosition / cameraRatio < cameraTopBorder) {
      // creates a div
      Element div = Element.div();
      // adds it to the scene if absent
      if (!scene.containsKey(e.id)) {
        print("added" + e.toString());
        //sets classes
        div.classes = e.types;
        scene.putIfAbsent(e.id, () => div);
      } else {
        div = scene[e.id];
      }

      // updates its values

      //div.text = "X:" + e.xPosition.toString() + "Y:" + e.yPosition.toString();
      // Viewport relativ
      div.style.left = (e.xPosition * 100).toString() + "%";
      div.style.bottom =
          ((e.yPosition - yCenter) * 100 / cameraRatio).toString() + "%";
      div.style.width = (e.xSize * 100).toString() + "%";
      div.style.height = (e.ySize * 100 / cameraRatio).toString() + "%";

      // inserts it in dom
      stage.insertAdjacentElement("afterBegin", div);
    }
    else {
      if (scene.containsKey(e.id)) {
        print("removed" + e.toString());
        scene[e.id].remove();
        scene.remove(e.id);
      }
    }
  }
}