part of 'places_cubit.dart';

abstract class PlacesState {}

final class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoaded extends PlacesState {
  final Map<PlacesModel, List<GetPlaceImageModel>> placesWithImages;

  PlacesLoaded(this.placesWithImages);
}

class PlacesError extends PlacesState {
  final String message;

  PlacesError(this.message);
}
