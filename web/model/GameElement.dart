abstract class GameElement {

  int id;
  bool active;

  GameElement(int id) {

  }

  bool getActive() {

    return active;

  }

  void activate() {

    active = true;

  }

  void deactivate() {

    active = false;

  }

}