part of 'visited_placed_cubit.dart';

sealed class VisitedPlacedState extends Equatable {
  const VisitedPlacedState();

  @override
  List<Object> get props => [];
}

final class VisitedPlacedInitial extends VisitedPlacedState {}

final class PlacesLoading extends VisitedPlacedState {}

final class PlacesLoaded extends VisitedPlacedState {
  final List<VisitedPlaces> places;
  const PlacesLoaded({required this.places});
}

final class PlacesError extends VisitedPlacedState {
  final String message;
  const PlacesError({required this.message});
}
