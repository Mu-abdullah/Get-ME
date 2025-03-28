import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home_screen/data/model/get_place_image_model.dart';
import '../../../../home_screen/data/model/places_model.dart';
import '../../../data/repo/places_repo.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesRepo repository = PlacesRepo();
  PlacesCubit() : super(PlacesInitial()) {
    loadPlaces();
  }
  static PlacesCubit get(context) => BlocProvider.of(context);

  Future<void> loadPlaces() async {
    emit(PlacesLoading());
    try {
      final placesWithImages = await repository.fetchPlacesWithImages();
      // shuffle the places
      
      emit(PlacesLoaded(placesWithImages));
    } catch (e) {
      emit(PlacesError(e.toString()));
    }
  }
}
