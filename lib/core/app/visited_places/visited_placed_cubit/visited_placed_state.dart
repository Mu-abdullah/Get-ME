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

class UserLoading extends VisitedPlacedState {}

class UserLoaded extends VisitedPlacedState {
  final UserModel user;
  const UserLoaded(this.user);
}

class UserError extends VisitedPlacedState {
  final String error;
  const UserError(this.error);
}
