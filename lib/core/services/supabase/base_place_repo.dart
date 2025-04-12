import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/home_screen/data/model/get_place_image_model.dart';
import '../../../features/home_screen/data/model/places_model.dart';
import 'backend_points.dart';

abstract class BasePlacesRepository {
  final supabase = Supabase.instance.client;

  Future<List<PlacesModel>> fetchPlacesByStatus({
    String? orderBy,
    required String status,
    int? limit,
    bool ascending = true,
  }) async {
    return _fetchPlaces(
      filterColumn: 'status',
      filterValue: status,
      limit: limit,
      ascending: ascending,
    );
  }

  Future<List<PlacesModel>> fetchPlacesByUser({
    String? orderBy,
    required int userId,
    int? limit,
    bool ascending = true,
  }) async {
    return _fetchPlaces(
      filterColumn: 'user_id',
      filterValue: userId,
      limit: limit,
      ascending: ascending,
    );
  }

  Future<List<PlacesModel>> _fetchPlaces({
    required String filterColumn,
    required dynamic filterValue,
    int? limit,
    bool ascending = true,
  }) async {
    try {
      var query = supabase
          .from(BackendPoint.places)
          .select()
          .eq(filterColumn, filterValue);

      if (limit != null) {
        query.limit(limit);
      }

      final placesResponse = await query;
      return _parsePlacesResponse(placesResponse);
    } catch (e) {
      throw PlacesRepositoryException('Failed to fetch places: $e');
    }
  }

  Future<List<GetPlaceImageModel>> fetchImagesForPlaces(
      List<String> placeIds) async {
    try {
      final imagesResponse = await supabase
          .from(BackendPoint.placeImages)
          .select()
          .inFilter('place_id', placeIds);

      return _parseImagesResponse(imagesResponse);
    } catch (e) {
      throw PlacesRepositoryException('Failed to fetch images: $e');
    }
  }

  Map<PlacesModel, List<GetPlaceImageModel>> groupPlacesWithImages(
    List<PlacesModel> places,
    List<GetPlaceImageModel> allImages,
  ) {
    final result = <PlacesModel, List<GetPlaceImageModel>>{};
    for (final place in places) {
      result[place] =
          allImages.where((image) => image.placeId == place.placeId).toList();
    }
    return result;
  }

  List<PlacesModel> _parsePlacesResponse(dynamic response) {
    return (response as List<dynamic>)
        .map((json) => PlacesModel.fromJson(json))
        .toList();
  }

  List<GetPlaceImageModel> _parseImagesResponse(dynamic response) {
    return (response as List<dynamic>)
        .map((json) => GetPlaceImageModel.fromJson(json))
        .toList();
  }
}

class PlacesRepositoryException implements Exception {
  final String message;
  PlacesRepositoryException(this.message);

  @override
  String toString() => 'PlacesRepositoryException: $message';
}
