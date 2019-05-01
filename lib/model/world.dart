

import 'package:demo/dimension.dart';

import 'entities/skateboard.dart';
import 'package:demo/entity.dart';

class World{

  List<Entity> entities;
  Skateboard player;
  Dimension size;

  //@todo
  List<Entity> getAllEntities(){
  return entities;
  }
  //@todo
  void removeAllEntities(){
    entities.clear();
  }
  //@todo
  void addAll(List<Entity> newEntities){
    entities.addAll(newEntities);
  }
  //@todo
  void addEntity(Entity entity){
    entities.add(entity);
  }
  //@todo
  void removeEntity(Entity entity){
    entities.remove(entity);
  }



}