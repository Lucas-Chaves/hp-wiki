import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter_app/core/helper/no_params.dart';
import 'package:injectable/injectable.dart';

import '../domain/domain.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getAllHousesUseCase,
  ) : super(HomeStateInit()) {
    on<HomeEventInit>(_init);
  }
  final GetAllHousesUseCase _getAllHousesUseCase;

  FutureOr<void> _init(HomeEventInit event, Emitter<HomeState> emit) async {
    emit(HomeStateLoading());
    final value = await _getAllHousesUseCase(NoParams.instance);
    value.fold(
      (left) => print(left.message),
      (right) {
        print(right);
      },
    );
    emit(HomeStateLoaded("asasaas"));
  }
}
