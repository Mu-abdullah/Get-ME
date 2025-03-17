import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/home_screen/data/model/get_place_image_model.dart';
import '../../../features/home_screen/data/model/places_model.dart';
import 'backend_points.dart';

abstract class BasePlacesRepository {
  final supabase = Supabase.instance.client;

  Future<List<PlacesModel>> fetchPlaces({
    Map<String, dynamic>? filters,
    required String orderBy,
    bool ascending = true,
  }) async {
    try {
      final query = supabase.from(BackendPoint.places).select();

      // Apply filters if provided
      filters?.forEach((key, value) {
        query.eq(key, value);
      });

      // Order the results
      query.order(orderBy, ascending: ascending);

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

class CityPlacesRepo extends BasePlacesRepository {
  Future<Map<PlacesModel, List<GetPlaceImageModel>>> fetchCityPlacesWithImages(
      {required String cityId}) async {
    try {
      // Fetch approved places for the given city
      final places = await fetchPlaces(
        filters: {
          'city_id': cityId,
          'status': PlaceStatus.approved,
        },
        orderBy: 'place_id',
        ascending: true,
      );

      // Fetch images for the retrieved places
      final images =
          await fetchImagesForPlaces(places.map((p) => p.placeId!).toList());

      // Group images by place
      return groupPlacesWithImages(places, images);
    } catch (e) {
      throw Exception('Failed to load city places: $e');
    }
  }
}

class PlacesRepository extends BasePlacesRepository {
  Future<Map<PlacesModel, List<GetPlaceImageModel>>>
      fetchPlacesWithImages() async {
    try {
      // Fetch approved places
      final places = await fetchPlaces(
        filters: {'status': PlaceStatus.approved},
        orderBy: 'place_id',
        ascending: true,
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
