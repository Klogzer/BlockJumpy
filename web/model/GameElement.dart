abstract class GameElement {
  final int _id;
  final String _type;

  GameElement(this._id, this._type);

  int get id => _id;

  String get type => _type;
}
