import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../home_screen/data/model/get_place_image_model.dart';
import '../../../../home_screen/data/model/places_model.dart';
import '../../../data/repo/user_place_repo.dart';

part 'user_places_state.dart';

class UserPlacesCubit extends Cubit<UserPlacesState> {
  final UserPlacesRepository repository;
  UserPlacesCubit(this.repository) : super(UserPlacesInitial()) {
    loadPlaces();
  }

  Future<void> loadPlaces() async {
    emit(UserPlacesLoading());
    try {
      final placesWithImages = await repository.fetchPlacesWithImages();
      if (!isClosed) {
        emit(UserPlacesLoaded(placesWithImages));
      }
    } catch (e) {
      if (!isClosed) {
        emit(UserPlacesError(e.toString()));
      }
    }
  }
}
