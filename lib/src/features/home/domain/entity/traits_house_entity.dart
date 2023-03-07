import 'package:json_annotation/json_annotation.dart';

part 'traits_house_entity.g.dart';

@JsonSerializable()
class TraitsHouseEntity {
  TraitsHouseEntity({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  static TraitsHouseEntity fromJson(Map<String, dynamic> e) =>
      _$TraitsHouseEntityFromJson(e);

  Map<String, dynamic> toJson() => _$TraitsHouseEntityToJson(this);
}
