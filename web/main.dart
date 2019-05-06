import 'dart:html';
import 'dart:math';

import 'package:demo/model/entities/skateboard.dart';

void main() {
  var mobile = false;
  Main main = new Main();

  Skateboard skate = Skateboard();

  main.createElement("div", "player", 1);
  main.addElement(main.map[1]);

  Element el = main.map[1];
  el.style.height = "100px";
  el.style.width = "100px";
  // deviceOrientation handler
  window.onDeviceOrientation.listen((ev) {
    if (ev.alpha == null && ev.beta == null && ev.gamma == null) {
      gamestage.style.display = 'block'; // Show QR code
    }
    // Device orientation available
    else {
      gamestage.style.display = 'none'; // Hide QR code
      mobile = true;
      // Determine ball movement from orientation event
      //
      // beta: 30° no move, 10° full up, 50° full down
      // gamma: 0° no move, -20° full left, 20° full right
      //
      final dy = min(50, max(10, ev.beta)) - 30;
      final dx = min(20, max(-20, ev.gamma));
      skate.moveBy(dx, dy);
    }
  });
}

// variable and its getters
get gamestage => document.querySelector("#gameStage");

class Main {
  Map map = Map();

  Element createElement(tag, type, id) {
    Element ele = Element.tag(tag)..id = "$type";
    map.putIfAbsent(id, () => ele);
    return ele;
  }

// needs to be a unique Element
  addElement(el) {
    //searches for gameStage div
    final el2 = document.querySelector("#gameStage");
    // inserts this new Element at the top of gameStage div
    el2.insertAdjacentElement("afterbegin", el);
    print("draw");
  }
}
