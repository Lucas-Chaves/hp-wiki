import 'package:harry_potter_app/src/features/features.dart';

class MapperHouse {
  static HouseModel fromHouseEntityToModel(HouseEntity entity) => HouseModel(
        id: entity.id,
        name: entity.name,
        houseColours: entity.houseColours,
        founder: entity.animal,
        animal: entity.animal,
        element: entity.element,
        ghost: entity.ghost,
        commonRoom: entity.commonRoom,
        heads: MapperHeadsHouse.fromListHeadsHouseEntityToModel(entity.heads),
        traits: MapperTraitsHouses.fromListEntityToModel(entity.traits),
      );

  static List<HouseModel> fromListHouseEntityToModel(
          List<HouseEntity> housesEntities) =>
      housesEntities
          .map((houseEntity) => fromHouseEntityToModel(houseEntity))
          .toList();
}
