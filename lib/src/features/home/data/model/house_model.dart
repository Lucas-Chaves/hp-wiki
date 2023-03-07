import 'heads_house_model.dart';
import 'traits_houses.dart';

class HouseModel {
  HouseModel({
    required this.id,
    required this.name,
    required this.houseColours,
    required this.founder,
    required this.animal,
    required this.element,
    required this.ghost,
    required this.commonRoom,
    required this.heads,
    required this.traits,
  });

  final String id;
  final String name;
  final String houseColours;
  final String founder;
  final String animal;
  final String element;
  final String ghost;
  final String commonRoom;
  final List<HeadsHouseModel> heads;
  final List<TraitsHouseModel> traits;
}
