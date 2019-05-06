import 'dart:html';


void main() {
  Element meinEle = document.querySelector("#gameStage");
  meinEle.requestFullscreen();
  Main main = new Main();

  for(int i = 0; i<= 10;i++){
    var el = main.createElement("div", "star", i);
    main.addElement(main.map[i]);
  }
  Element el = main.map[9];
  el.style.height ="100px";
  el.style.width ="100px";


}

class Main {
  Map map = new Map();

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
