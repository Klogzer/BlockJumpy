import 'package:demo/upgrade.dart';

class SaveGame{
  List<Upgrade> upgrades;
  String name;
  int highscore;
  int money;

  void addUpgrade(Upgrade upgrade){
    upgrades.add(upgrade);
  }
  void removeUpgrade(Upgrade upgrade){
    upgrades.remove(upgrade);
  }
  void addMoney(int money){
    this.money += money.abs();
  }
  void removeMoney(int money){
    this.money -= money.abs();
  }
}