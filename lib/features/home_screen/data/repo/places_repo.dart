import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/services/supabase/backend_points.dart';
import '../model/get_place_image_model.dart';
import '../model/places_model.dart';

class PlacesRepository {
  final supabase = Supabase.instance.client;

  Future<Map<PlacesModel, List<GetPlaceImageModel>>>
      fetchPlacesWithImages() async {
    try {
      // Fetch places with status 'approved'
      final placesResponse = await supabase
          .from(BackendPoint.places)
          .select()
          .eq('status', PlaceStatus.approved)
          .order('place_id', ascending: true);

      final List<PlacesModel> places = (placesResponse as List<dynamic>)
          .map((json) => PlacesModel.fromJson(json))
          .toList();

      // Fetch images for the retrieved places
      final imagesResponse = await supabase
          .from(BackendPoint.placeImages)
          .select()
          .inFilter('place_id', places.map((p) => p.placeId).toList());

      final List<GetPlaceImageModel> allImages =
          (imagesResponse as List<dynamic>)
              .map((json) => GetPlaceImageModel.fromJson(json))
              .toList();

      // Group images by place
      final Map<PlacesModel, List<GetPlaceImageModel>> result = {};
      for (var place in places) {
        result[place] =
            allImages.where((img) => img.placeId == place.placeId).toList();
      }

      return result;
    } catch (e) {
      throw Exception('Failed to load places: $e');
    }
  }
}
