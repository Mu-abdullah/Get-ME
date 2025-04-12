import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/base_place_repo.dart';
import '../model/get_place_image_model.dart';
import '../model/places_model.dart';

class PlacesRepository extends BasePlacesRepository {
  Future<Map<PlacesModel, List<GetPlaceImageModel>>>
      fetchPlacesWithImages() async {
    try {
      // Fetch approved places
      final places = await fetchPlacesByStatus(
        status: PlaceStatus.approved,
        orderBy: 'place_id',
        ascending: true,
        limit: 15,
      );

      // Fetch images for the retrieved places
      final images =
          await fetchImagesForPlaces(places.map((p) => p.placeId!).toList());

      // Group images by place
      return groupPlacesWithImages(places, images);
    } catch (e) {
      throw Exception('Failed to load places: $e');
    }
  }
}
