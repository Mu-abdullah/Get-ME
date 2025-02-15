part of 'home_city_cubit.dart';

abstract class HomeCityState {}

class HomeInitial extends HomeCityState {}

class LoadingCities extends HomeCityState {}

class ErrorGetCities extends HomeCityState {
  final String message;
  ErrorGetCities(this.message);
}

class CitiesLoaded extends HomeCityState {
  final List<CityModel> cities;
  CitiesLoaded(this.cities);
}
