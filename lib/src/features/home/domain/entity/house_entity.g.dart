// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseEntity _$HouseEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['heads', 'traits'],
  );
  return HouseEntity(
    id: json['id'] as String,
    name: json['name'] as String,
    houseColours: json['houseColours'] as String,
    founder: json['founder'] as String,
    animal: json['animal'] as String,
    element: json['element'] as String,
    ghost: json['ghost'] as String,
    commonRoom: json['commonRoom'] as String,
    heads: HouseEntity._headsHouseEntityFromJsonList(json['heads'] as List),
    traits: HouseEntity._traitsHouseEntityFromJsonList(json['traits'] as List),
  );
}

Map<String, dynamic> _$HouseEntityToJson(HouseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'houseColours': instance.houseColours,
      'founder': instance.founder,
      'animal': instance.animal,
      'element': instance.element,
      'ghost': instance.ghost,
      'commonRoom': instance.commonRoom,
      'heads': instance.heads.map((e) => e.toJson()).toList(),
      'traits': instance.traits.map((e) => e.toJson()).toList(),
    };
