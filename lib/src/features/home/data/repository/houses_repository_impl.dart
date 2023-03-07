import 'dart:async';

import 'package:either_dart/either.dart';

import '../../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class HouseRepositoryImpl implements HouseRepository {
  @override
  FutureOr<Either<Failure, List<HouseModel>>> fetchAllHouses() {
    // TODO: implement fetchAllHouses
    throw UnimplementedError();
  }
}
