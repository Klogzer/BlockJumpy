import 'dart:html';
import 'dart:math';

import 'package:jumpdx9001deluxe/model/game_element.dart';

class Camera {
  /// Debugg
  ///
  ///
  Element main = Element.div();
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
    //var watch = Stopwatch();
    //watch.start();
    // Timer start here
    main.children.forEach((e) => e.remove());
    entities.forEach(renderElement);
    stage.children = main.children;
    // Timer end here
    // gimme the rendertimes
    //watch.stop();
    //print(watch.elapsedTicks);
  }

  renderElement(GameElement e) {
    if ((e.yPosition > cameraBottomBorder && e.yPosition < cameraTopBorder)) {
      // creates a div
      Element div;
      // adds it to the scene if absent
      if (!scene.containsKey(e.id)) {
        //print("added" + e.toString());
        div = Element.div();
        scene.putIfAbsent(e.id, () => div);
      } else {
        div = scene[e.id];
      }

      //sets classes
      div.classes = e.types;
      // updates its values
      //div.text = "X:" + e.xPosition.toString() + "Y:" + e.yPosition.toString();
      // Viewport relativ
      div.text = e.toString();
      div.style.left = (e.xPosition * 100).toString() + "%";
      div.style.bottom =
          ((e.yPosition - yCenter) * 100 / cameraRatio).toString() + "%";
      div.style.width = (e.xSize * 100).toString() + "%";
      div.style.height = (e.ySize * 100 / cameraRatio).toString() + "%";

      // inserts it in dom
      main.insertAdjacentElement("afterBegin", div);
    }
  }
}
