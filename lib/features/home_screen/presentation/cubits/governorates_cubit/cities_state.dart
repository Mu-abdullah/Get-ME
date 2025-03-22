part of 'cities_cubit.dart';

abstract class CitiesState {}

class CitiesInitial extends CitiesState {}

class LoadingCities extends CitiesState {}

class ErrorGetCities extends CitiesState {
  final String message;
  ErrorGetCities(this.message);
}

class CitiesLoaded extends CitiesState {
  final List<GovernoratesModel> cities;
  CitiesLoaded(this.cities);
}
