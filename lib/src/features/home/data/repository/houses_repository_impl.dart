import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

@Injectable(as: HouseRepository)
class HouseRepositoryImpl implements HouseRepository {
  HouseRepositoryImpl(this._housesDataSource);

  final HousesDataSource _housesDataSource;

  @override
  FutureOr<Either<DefaultException, List<HouseModel>>> fetchAllHouses() async {
    try {
      final listHouseEntities = await _housesDataSource.fetchAllHouses();
      return Right(MapperHouse.fromListHouseEntityToModel(listHouseEntities));
    } on DefaultException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        DefaultException(
          error: TypeError.local,
          message: e.toString(),
        ),
      );
    }
  }
}
