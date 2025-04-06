import '../../../../auth/data/models/user_model.dart';
import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';

class GetUserFromShared {
  Future<UserModel?> getUser() async {
    final user = await SharedPref.getUserFromPreferences(
      key: PrefKeys.userModel,
    );
    if (user != null) {
      return UserModel.fromJson(user);
    } else {
      return null;
    }
  }
}
