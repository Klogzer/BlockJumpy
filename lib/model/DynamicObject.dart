mixin DynamicObject {

  int duration = 0;

  void move() {

  }

  void reset() {

    duration = 0;

  }

  int getDuration() {

    return duration;

  }

  void setDuration(int duration) {

    this.duration = duration;

  }

}