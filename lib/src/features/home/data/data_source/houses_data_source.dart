import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../domain/domain.dart';

abstract class HousesDataSource {
  FutureOr<Either<Failure, List<HouseEntity>>> fetchAllHouses();
}

@Injectable(as: HousesDataSource)
class HousesDataSourceImpl implements HousesDataSource {
  HousesDataSourceImpl(this._client);

  final CustomHttpClient _client;

  @override
  FutureOr<Either<Failure, List<HouseEntity>>> fetchAllHouses() async {
    try {
      final response = await _client.get(url: '/Houses');
      final houses = HouseEntity.listFromJsonHouseEntity(response.data);
      return Right(houses);
    } catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
