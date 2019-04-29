
import 'package:demo/status_modifier.dart';

class StarModifier extends StatusModifier{
  @override
  int duration;

  @override
  String name;

  StarModifier() : super("StarPower", 10);

}