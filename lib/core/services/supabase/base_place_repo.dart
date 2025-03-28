import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/home_screen/data/model/get_place_image_model.dart';
import '../../../features/home_screen/data/model/places_model.dart';
import 'backend_points.dart';

abstract class BasePlacesRepository {
  final supabase = Supabase.instance.client;

  Future<List<PlacesModel>> fetchPlaces({
     String? orderBy,
    required String status,
    int? limit,
    bool ascending = true,
  }) async {
    try {
      final query =
          supabase.from(BackendPoint.places).select().eq("status", status);
      // Apply limit if provided
      if (limit != null) {
        query.limit(limit);
      }
      // Order the results
      query.order(orderBy ?? 'created_at', ascending: ascending);

      final placesResponse = await query;
      return (placesResponse as List<dynamic>)
          .map((json) => PlacesModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch places: $e');
    }
  }

  Future<List<GetPlaceImageModel>> fetchImagesForPlaces(
      List<String> placeIds) async {
    try {
      final imagesResponse = await supabase
          .from(BackendPoint.placeImages)
          .select()
          .inFilter('place_id', placeIds);

      return (imagesResponse as List<dynamic>)
          .map((json) => GetPlaceImageModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch images: $e');
    }
  }

  Future<Map<PlacesModel, List<GetPlaceImageModel>>> groupPlacesWithImages(
      List<PlacesModel> places, List<GetPlaceImageModel> allImages) async {
    final Map<PlacesModel, List<GetPlaceImageModel>> result = {};
    for (var place in places) {
      result[place] =
          allImages.where((img) => img.placeId == place.placeId).toList();
    }
    return result;
  }
}
