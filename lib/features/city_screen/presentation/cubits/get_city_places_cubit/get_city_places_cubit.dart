import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/features/home_screen/data/model/city_model.dart';

import '../../../../home_screen/data/model/get_place_image_model.dart';
import '../../../../home_screen/data/model/places_model.dart';
import '../../../data/repo/city_places.dart';

part 'get_city_places_state.dart';

class GetCityPlacesCubit extends Cubit<GetCityPlacesState> {
  CityPlacesRepo repo;
  final CityModel city;
  GetCityPlacesCubit({required this.repo, required this.city})
      : super(GetCityPlacesInitial()) {
    getCityPlaces(
      city.id!,
    );
  }
  static GetCityPlacesCubit get(context) => BlocProvider.of(context);

  Future<void> getCityPlaces(
    int cityId,
  ) async {
    emit(GetCityPlacesLoading());
    try {
      final places = await repo.fetchCityPlacesWithImages(
        cityId: cityId,
      );

      emit(GetCityPlacesLoaded(places));
    } catch (e) {
      emit(GetCityPlacesError(e.toString()));
    }
  }
}
