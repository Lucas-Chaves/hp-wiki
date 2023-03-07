import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../data/data.dart';

abstract class GetAllHousesUseCase<TResult, TParams> {
  FutureOr<Either<Failure, TResult>> call(TParams params);
}

@Injectable(as: GetAllHousesUseCase)
class GetAllHousesUsecaseImpl
    implements GetAllHousesUseCase<List<HouseModel>, NoParams> {
  @override
  FutureOr<Either<Failure, List<HouseModel>>> call(NoParams params) async {
    return Left(ServerFailure(errorMessage: 'Teste Error'));
  }
}
