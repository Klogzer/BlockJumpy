mixin DynamicObject {
  int _duration;

  void reset() {
    _duration = 0;
  }

  int get duration => duration;
}
