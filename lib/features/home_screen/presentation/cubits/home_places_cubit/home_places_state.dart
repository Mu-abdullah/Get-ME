part of 'home_places_cubit.dart';

abstract class HomePlacesState {}

class PlacesInitial extends HomePlacesState {}

class PlacesLoading extends HomePlacesState {}

class PlacesLoaded extends HomePlacesState {
  final Map<PlacesModel, List<GetPlaceImageModel>> placesWithImages;

  PlacesLoaded(this.placesWithImages);
}

class PlacesError extends HomePlacesState {
  final String message;

  PlacesError(this.message);
}
