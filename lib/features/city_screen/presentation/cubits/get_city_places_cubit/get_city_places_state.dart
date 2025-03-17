part of 'get_city_places_cubit.dart';

abstract class GetCityPlacesState {}

final class GetCityPlacesInitial extends GetCityPlacesState {}

final class GetCityPlacesLoading extends GetCityPlacesState {}

final class GetCityPlacesLoaded extends GetCityPlacesState {
  final Map<PlacesModel, List<GetPlaceImageModel>> places;
  GetCityPlacesLoaded(this.places);
}

final class GetCityPlacesError extends GetCityPlacesState {
  final String message;
  GetCityPlacesError(this.message);
}