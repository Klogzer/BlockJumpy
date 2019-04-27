import 'status_modifier.dart';

class PointModifier extends StatusModifier{
  @override
  int duration;

  @override
  String name;

  PointModifier() : super("MoarPointz", 10);
}