import 'status_modifier.dart';

abstract class Upgrade{
  String name;
  int price;
  List<StatusModifier> statusModifier;
}