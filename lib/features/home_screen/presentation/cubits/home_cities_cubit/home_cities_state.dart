part of 'home_cities_cubit.dart';

abstract class HomeCitiesState {}

final class HomeCitiesInitial extends HomeCitiesState {}

class LoadingCity extends HomeCitiesState {}

class ErrorGetCity extends HomeCitiesState {
  final String message;
  ErrorGetCity(this.message);
}

class CityLoaded extends HomeCitiesState {
  final List<HomeGetCitiesModel> cities;
  CityLoaded(this.cities);
}
