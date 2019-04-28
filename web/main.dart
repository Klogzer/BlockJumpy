import 'dart:html';

void main() {
  var el = createElement("div", "star", 2);
  drawElement(el);
}

List list = new List();

Element createElement(tag, type, id) {
  return Element.tag(tag)..id = "$type $id";
}

drawElement(el) {
  //searches for gameStage div
  final el = document.querySelector("#gameStage");
  // inserts this new Element at the top of gameStage div
  list.add(el);
  el.insertAdjacentElement("beforebegin", el);
}
