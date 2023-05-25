part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeStateInit extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateLoaded extends HomeState {
  HomeStateLoaded({
    required this.houses,
    required this.filteredHouse,
  });

  final List<HouseModel> houses;
  final HouseModel filteredHouse;

  @override
  List<Object?> get props => [houses, filteredHouse];
}
