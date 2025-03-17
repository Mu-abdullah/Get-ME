import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/get_place_image_model.dart';
import '../../../data/model/places_model.dart';
import '../../../data/repo/places_repo.dart';

part 'home_places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  final PlacesRepository repository;

  PlacesCubit(this.repository) : super(PlacesInitial()) {
    loadPlaces();
  }

  Future<void> loadPlaces() async {
    emit(PlacesLoading());
    try {
      final placesWithImages = await repository.fetchPlacesWithImages();

      emit(PlacesLoaded(placesWithImages));
    } catch (e) {
      emit(PlacesError(e.toString()));
    }
  }
}
