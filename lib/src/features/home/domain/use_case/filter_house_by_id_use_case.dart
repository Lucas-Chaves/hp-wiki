import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../data/data.dart';

abstract class FilterHouseByIdUseCase {
  FutureOr<Either<DefaultException, HouseModel>> call(HouseFilterParams params);
}

@Injectable(as: FilterHouseByIdUseCase)
class FilterHouseByIdUseCaseImpl implements FilterHouseByIdUseCase {
  @override
  FutureOr<Either<DefaultException, HouseModel>> call(
    HouseFilterParams params,
  ) {
    try {
      final filteredHouse = params.houses.firstWhere(
        (house) => house.id == params.idFilter,
        orElse: () => params.houses.first,
      );
      return Right(
        filteredHouse,
      );
    } catch (e) {
      return Left(
        DefaultException(message: 'Not Found', error: TypeError.local),
      );
    }
  }
}

class HouseFilterParams {
  HouseFilterParams(this.houses, this.idFilter);

  final List<HouseModel> houses;
  final String idFilter;
}
