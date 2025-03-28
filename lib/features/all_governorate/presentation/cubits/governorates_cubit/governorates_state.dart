part of 'governorates_cubit.dart';

abstract class GovernoratesState {}

class GovernoratesInitial extends GovernoratesState {}

class LoadingGovernorates extends GovernoratesState {}

class ErrorGetGovernorates extends GovernoratesState {
  final String message;
  ErrorGetGovernorates(this.message);
}

class GovernoratesLoaded extends GovernoratesState {
  final List<GovernoratesModel> cities;
  GovernoratesLoaded(this.cities);
}
