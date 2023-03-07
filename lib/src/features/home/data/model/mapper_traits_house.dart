import 'package:harry_potter_app/src/features/features.dart';

class MapperTraitsHouses {
  static TraitsHouseModel fromEntityToModel(TraitsHouseEntity entity) =>
      TraitsHouseModel(
        id: entity.id,
        name: entity.name,
      );

  static List<TraitsHouseModel> fromListEntityToModel(
          List<TraitsHouseEntity> entities) =>
      entities
          .map(
            (entity) => fromEntityToModel(entity),
          )
          .toList();
}
