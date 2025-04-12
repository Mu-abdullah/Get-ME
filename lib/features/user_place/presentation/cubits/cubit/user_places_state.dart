part of 'user_places_cubit.dart';

sealed class UserPlacesState extends Equatable {
  const UserPlacesState();

  @override
  List<Object> get props => [];
}

final class UserPlacesInitial extends UserPlacesState {}

final class UserPlacesLoading extends UserPlacesState {}

final class UserPlacesLoaded extends UserPlacesState {
  final Map<PlacesModel, List<GetPlaceImageModel>> placesWithImages;
  const UserPlacesLoaded(this.placesWithImages);
}

final class UserPlacesError extends UserPlacesState {
  final String message;
  const UserPlacesError(this.message);
}