import 'dart:html';

import 'dart:math';

class Controller {
  // physix and stuff
  // View
  // model
  bool end = false;
  // Timer etc
  Controller(){


    // Keyboard eventlistening
    window.onKeyDown.listen((KeyboardEvent ev) {
      if (end) return;
      switch (ev.keyCode) {
        case KeyCode.LEFT:  print("Left"); break;
        case KeyCode.RIGHT: print("Right"); break;
        case KeyCode.UP:    print("Up"); break;
        case KeyCode.DOWN:  print("Down"); break;
      }
    });

    // Device orientation event handler.
    //
    window.onDeviceOrientation.listen((ev) {

      // No device orientation
      if (ev.alpha == null && ev.beta == null && ev.gamma == null) {
        // no deviceorientation found do something here
      }
      // Device orientation available
      else {
        // movement from orientation event
        //
        // beta: 30° no move, 10° full up, 50° full down
        // gamma: 0° no move, -20° full left, 20° full right
        //
        final dy = min(50, max(10, ev.beta)) - 30;
        final dx = min(20, max(-20, ev.gamma));
        print(dx.toString() + "|dx " + dy.toString() + "|dy");
      }
    });


  }

}