import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:harry_potter_app/src/features/features.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';

abstract class GetAllHousesUseCase {
  FutureOr<Either<DefaultException, List<HouseModel>>> call(NoParams params);
}

@Injectable(as: GetAllHousesUseCase)
class GetAllHousesUsecaseImpl extends GetAllHousesUseCase {
  GetAllHousesUsecaseImpl(this._houseRepository);

  final HouseRepository _houseRepository;

  @override
  FutureOr<Either<DefaultException, List<HouseModel>>> call(
      NoParams params) async {
    return _houseRepository.fetchAllHouses();
  }
}
