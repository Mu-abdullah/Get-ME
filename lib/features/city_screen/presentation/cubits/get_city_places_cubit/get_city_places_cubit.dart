import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home_screen/data/model/get_place_image_model.dart';
import '../../../../home_screen/data/model/places_model.dart';
import '../../../data/repo/city_places.dart';

part 'get_city_places_state.dart';

class GetCityPlacesCubit extends Cubit<GetCityPlacesState> {
  CityPlacesRepo repo;
  final int cityId;
  GetCityPlacesCubit({required this.repo, required this.cityId})
      : super(GetCityPlacesInitial()) {
    getCityPlaces(cityId);
  }
  static GetCityPlacesCubit get(context) => BlocProvider.of(context);

  Future<void> getCityPlaces(int cityId) async {
    emit(GetCityPlacesLoading());
    try {
      final places = await repo.fetchCityPlacesWithImages(cityId: cityId);

      emit(GetCityPlacesLoaded(places));
    } catch (e) {
      emit(GetCityPlacesError(e.toString()));
    }
  }
}
