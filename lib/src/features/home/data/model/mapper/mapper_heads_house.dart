import 'package:harry_potter_app/src/features/features.dart';

class MapperHeadsHouse {
  static HeadsHouseModel fromHeadsHouseEntityToModel(HeadsHouseEntity entity) =>
      HeadsHouseModel(
        entity.id,
        entity.firstName,
        entity.lastName,
      );

  static List<HeadsHouseModel> fromListHeadsHouseEntityToModel(
          List<HeadsHouseEntity> entities) =>
      entities
          .map(
            (entity) => fromHeadsHouseEntityToModel(entity),
          )
          .toList();
}
