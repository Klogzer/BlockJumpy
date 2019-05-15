mixin DynamicObject {
  int _duration;

  void move();

  void reset() {
    _duration = 0;
  }

  int get duration => duration;
}
