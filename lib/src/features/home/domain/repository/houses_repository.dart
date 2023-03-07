import 'dart:async';

import 'package:either_dart/either.dart';

import '../../../../../core/core.dart';
import '../../home.dart';

abstract class HouseRepository {
  FutureOr<Either<DefaultException, List<HouseModel>>> fetchAllHouses();
}
