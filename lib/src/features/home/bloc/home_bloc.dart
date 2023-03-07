import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../domain/domain.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._client,
    this._getAllHousesUseCase,
  ) : super(HomeStateInit()) {
    on<HomeEventInit>(_init);
  }
  final CustomHttpClient _client;
  final GetAllHousesUseCase _getAllHousesUseCase;

  FutureOr<void> _init(HomeEventInit event, Emitter<HomeState> emit) async {
    emit(HomeStateLoading());
    final response = await _client.get(url: '/Houses');
    // final teste = await _getAllHousesUseCase.call(NoParams.instance);
    // teste.fold(
    //   (left) => print(left),
    //   (right) => print(right),
    // );
    emit(HomeStateLoaded(response.data[0]['houseColours'].toString()));
  }
}
