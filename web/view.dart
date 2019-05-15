import 'dart:html';

import 'package:jumpdx9001deluxe/model/game.dart';
import 'package:jumpdx9001deluxe/model/game_element.dart';

class View {
  String appearance;
  Map<int, Element> domMap = Map();

  // querySelector for Stage
  final stage = querySelector("#stage");

  void update(Game game) {
    String left;
    String bottom;
    GameElement currentEntity;
    domMap.forEach((key, ele) => {
          currentEntity = game.getElements().where((entity)=> entity.id == key) as GameElement,
          //ele.style.bottom = currentEntity.bottom,
          //ele.style.left = currentEntity.left,
        });
  }

  void prepareGameStage() {
    print("doing");
    // List list = game.getList();
    // List<GameElement> list = [[][]];
    // mock start
    Map<int, String> map = Map();
    map.putIfAbsent(1, () => "normalPlatform");
    map.putIfAbsent(2, () => "normalPlatform");
    // mock end
    //

    Element ele;
    int i = 1;
    map.forEach((id, name) => {
          ele = Element.div(),
          ele.classes.add(name),
          ele.classes.add("platform"),
          // set according to Model
          ele.style.left = (50 * i).toString() + "px",
          ele.style.bottom = (100 * i).toString() + "px",
          ele.style.position = "absolute",
          i++,
          stage.insertAdjacentElement("afterBegin", ele),
          // put in the map to call it later without the hazzle to get a real css id
          domMap.putIfAbsent(id, () => ele)
        });
    /*
        <img class="platform normalPlatform" id="1" style="left: 200px; bottom: 100px">
        <img class="platform boostPlatform" id="2" style="left: 50px; bottom: 200px">
        <img class="platform deadlyPlatform" id="3" style="left: 80px; bottom: 300px">
        <img class="platform protectionPlatform" id="4" style="left: 350px; bottom: 400px">
        <img class="platform oneTimePlatform" id="5" style="left: 120px; bottom: 500px">        
     */
  }
}
