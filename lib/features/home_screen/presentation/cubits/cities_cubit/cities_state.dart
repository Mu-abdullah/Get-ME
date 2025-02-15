part of 'cities_cubit.dart';

abstract class CitiesState {}

class CitiesInitial extends CitiesState {}

class LoadingCities extends CitiesState {}

class ErrorGetCities extends CitiesState {
  final String message;
  ErrorGetCities(this.message);
}

class CitiesLoaded extends CitiesState {
  final List<CityModel> cities;
  CitiesLoaded(this.cities);
}
