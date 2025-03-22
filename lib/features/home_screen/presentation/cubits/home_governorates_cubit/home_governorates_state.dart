part of 'home_governorates_cubit.dart';

abstract class HomeGovernoratesState {}

class HomeInitial extends HomeGovernoratesState {}

class LoadingGovernorates extends HomeGovernoratesState {}

class ErrorGetGovernorates extends HomeGovernoratesState {
  final String message;
  ErrorGetGovernorates(this.message);
}

class GovernoratesLoaded extends HomeGovernoratesState {
  final List<GovernoratesModel> cities;
  GovernoratesLoaded(this.cities);
}
