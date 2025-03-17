import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/base_place_repo.dart';
import '../../../home_screen/data/model/get_place_image_model.dart';
import '../../../home_screen/data/model/places_model.dart';

class CityPlacesRepo extends BasePlacesRepository {
  Future<Map<PlacesModel, List<GetPlaceImageModel>>> fetchCityPlacesWithImages({
    required int cityId,
  }) async {
    try {
      // Fetch approved places for the given city
      final placesData = await supabase
          .from(BackendPoint.places)
          .select()
          .eq('city_id', cityId);

      if (placesData.isEmpty) return {};

      // Convert Supabase response to PlacesModel objects
      final places =
          placesData.map((data) => PlacesModel.fromJson(data)).toList();

      // Fetch images for the retrieved places
      final images = await fetchImagesForPlaces(
        places.map((p) => p.placeId!).toList(),
      );

      // Group images by place
      return groupPlacesWithImages(places, images);
    } catch (e) {
      throw Exception('Failed to load city places: $e');
    }
  }
}
