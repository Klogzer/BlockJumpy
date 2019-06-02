import 'dart:html';

/// has buttons which are unique by their labels
class Menu {
  // outer Div for the Buttons
  Element window;

  /// requires width and height to set the window size accordingly
  /// input normalised 0.0 - 1.0
  /// Map<String,Function> buttons
  Menu(Map<String,Function> buttons) {
    window = Element.div();
    buttons.forEach((str,f) => addButton(str, f));

    // css Menu design
    window.classes.add("menu");
  }

  Map<String, Element> buttons = Map<String, Element>();

  void addButton(String label, Function f) {

    Element element = Element.div();

    element.text = label;
    // insert by label
    buttons.putIfAbsent(label, () => element);
    window.insertAdjacentElement("afterBegin", element);

    // Actionlistener
    element.onClick.listen((_) {
      f();
    });
  }
}
