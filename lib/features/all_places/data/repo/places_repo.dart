import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/base_place_repo.dart';
import '../../../home_screen/data/model/get_place_image_model.dart';
import '../../../home_screen/data/model/places_model.dart';

class PlacesRepo extends BasePlacesRepository {
  Future<Map<PlacesModel, List<GetPlaceImageModel>>>
      fetchPlacesWithImages() async {
    try {
      // Fetch approved places
      final places = await fetchPlaces(
        status: PlaceStatus.approved,
        ascending: true,
      );

      final images =
          await fetchImagesForPlaces(places.map((p) => p.placeId!).toList());

      // Group images by place
      return groupPlacesWithImages(places, images);
    } catch (e) {
      throw Exception('Failed to load places: $e');
    }
  }
}
