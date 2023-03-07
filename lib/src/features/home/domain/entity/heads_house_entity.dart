import 'package:json_annotation/json_annotation.dart';

part 'heads_house_entity.g.dart';

@JsonSerializable()
class HeadsHouseEntity {
  HeadsHouseEntity(
    this.id,
    this.firstName,
    this.lastName,
  );

  final String id;
  final String firstName;
  final String lastName;

  static HeadsHouseEntity fromJson(Map<String, dynamic> e) =>
      _$HeadsHouseEntityFromJson(e);

  Map<String, dynamic> toJson() => _$HeadsHouseEntityToJson(this);
}
