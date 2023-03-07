import 'dart:async';

import 'package:either_dart/either.dart';

import '../../../../../core/core.dart';
import '../../home.dart';

abstract class HouseRepository {
  FutureOr<Either<Failure, List<HouseModel>>> fetchAllHouses();
}


