import 'package:hive/hive.dart';



@HiveType(typeId: 0)
class GameModel {
  @HiveField(0)
  final String name;
final String type;
final int hourPrice;
  GameModel(this.name,this.type,this.hourPrice);
}
