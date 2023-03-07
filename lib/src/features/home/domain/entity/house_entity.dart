import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';

part 'house_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class HouseEntity {
  HouseEntity({
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
  @JsonKey(required: true, fromJson: _headsHouseEntityFromJsonList)
  final List<HeadsHouseEntity> heads;
  @JsonKey(required: true, fromJson: _traitsHouseEntityFromJsonList)
  final List<TraitsHouseEntity> traits;

  static HouseEntity fromJson(Map<String, dynamic> e) =>
      _$HouseEntityFromJson(e);

  static Map<String, dynamic> fromEntity(HouseEntity entity) =>
      _$HouseEntityToJson(entity);

  static List<HeadsHouseEntity> _headsHouseEntityFromJsonList(
          Iterable jsonList) =>
      jsonList.map((e) => HeadsHouseEntity.fromJson(e)).toList();

  static List<TraitsHouseEntity> _traitsHouseEntityFromJsonList(
          Iterable jsonList) =>
      jsonList.map((e) => TraitsHouseEntity.fromJson(e)).toList();

  static List<HouseEntity> listFromJsonHouseEntity(Iterable jsonList) =>
      jsonList.map((value) => fromJson(value)).toList();
}
