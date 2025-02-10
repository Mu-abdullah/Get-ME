part of 'city_cubit.dart';

abstract class CityState {}

class HomeInitial extends CityState {}

class LoadingCities extends CityState {}

class ErrorGetCities extends CityState {
  final String message;
  ErrorGetCities(this.message);
}

class CitiesLoaded extends CityState {
  final List<CityModel> cities;
  CitiesLoaded(this.cities);
}
