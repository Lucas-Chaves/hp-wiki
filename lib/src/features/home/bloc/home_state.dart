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
  HomeStateLoaded(this.response);

  final String response;

  @override
  List<Object?> get props => [response];
}
