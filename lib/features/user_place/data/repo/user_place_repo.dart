import '../../../../auth/data/models/user_model.dart';
import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../core/services/supabase/base_place_repo.dart';
import '../../../home_screen/data/model/get_place_image_model.dart';
import '../../../home_screen/data/model/places_model.dart';

class UserPlacesRepository extends BasePlacesRepository {
  Future<Map<PlacesModel, List<GetPlaceImageModel>>>
      fetchPlacesWithImages() async {
    await getUser();
    try {
      // Fetch approved places
      final places = await fetchPlacesByUser(
        userId: user!.id!,
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

  UserModel? user;

  Future<UserModel?> getUser() async {
    var userdate = await SharedPref.getUserFromPreferences(
      key: PrefKeys.userModel,
    );
    if (userdate != null) {
      var userModel = UserModel.fromJson(userdate);

      user = userModel;

      return UserModel.fromJson(userdate);
    } else {
      return null;
    }
  }
}
