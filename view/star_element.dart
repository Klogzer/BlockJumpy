import 'dart:html';

import 'view_element.dart';

class StarElement extends ViewElement{
  StarElement();
  @override
  String type = "star";
  @override
  draw() {
    //searches for gameStage div
    final el = document.querySelector("#gameStage");
    // inserts this new Element at the top of gameStage div
    final el2 = Element.tag(tag)..id = "$type $id";
    el.insertAdjacentElement("afterbegin", el2);
  }
}