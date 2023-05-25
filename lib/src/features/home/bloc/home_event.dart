part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class HomeEventInit extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeEventFilter extends HomeEvent {
  HomeEventFilter({
    required this.idFilter,
  });

  final String idFilter;

  @override
  List<Object?> get props => [];
}
