/// @Author Marius Mauritz
import 'dart:html';
import 'dart:math';

import 'package:jumpdx9001deluxe/model/game_element.dart';

class Camera {

  // the root for the update
  Element main = Element.div();
  Map<int,Element> map = Map();
  double cameraRatio;
  double yCenter = 0;

  // no need for an x Anchoring yet
  // double cameraXPosition;
  int cameraHeight;
  int cameraWidth;

  // querySelector for Stage
  final stage = querySelector("#stage");

  /// Constructor
  Camera(this.cameraHeight, this.cameraWidth) {
    this.cameraRatio = cameraHeight / cameraWidth;
  }
  // cameraTopBorder as float
  double get cameraTopBorder => yCenter + cameraRatio;
  // cameraBottomBorder as float
  double get cameraBottomBorder => yCenter - cameraRatio;

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
    main.children = [];
    entities.forEach(_renderElement);
    stage.children = main.children;
  }

  _renderElement(GameElement e) {
    if (e.yPosition > cameraBottomBorder && e.yPosition < cameraTopBorder || e.ySize + e.yPosition >cameraBottomBorder  ) {
      Element div;
      if(map.containsKey(e.id)){
        div = map[e.id];
      }
      else{
        div = Element.div();
        map.putIfAbsent(e.id,()=> div);
      }

      //sets classes
      div.classes = e.types;
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
    else{
      if(map.containsKey(e.id)){
        map[e.id].remove();
      }
    }
  }
}
