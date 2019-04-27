import 'dart:html';

void main() {
  var id = "star";
  final el = document.querySelector("#gameStage");

  final el2 = Element.tag("div")..id="$id";
  el.insertAdjacentElement("afterbegin", el2);

}

