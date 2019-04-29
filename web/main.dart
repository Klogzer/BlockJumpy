import 'dart:html';

import 'package:demo/model/world.dart';
void main() {
  var el = createElement("div", "star");
  addElement(el);
  World world = new World();
}

List list = new List();

Element createElement(tag, type) {
  return Element.tag(tag)
    ..id = "$type";
}
// needs to be a unique Element
addElement(el) {
  //searches for gameStage div
  final el2 = document.querySelector("#gameStage");
  // inserts this new Element at the top of gameStage div
  el2.insertAdjacentElement("afterbegin", el);
}

