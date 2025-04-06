import 'package:dartz/dartz.dart';
import 'package:getme/core/language/lang_keys.dart';

import '../../../core/error/custom_errors.dart';
import '../../../core/services/supabase/backend_points.dart';
import '../../../core/services/supabase/supabase_services_repo.dart';
import '../models/user_model.dart';

class AuthUserRepo {
  Future<Either<CustomError, List<UserModel>>> getUser({
    required String searchQuery,
  }) async {
    try {
      final String formattedQuery = "%$searchQuery%";
      final phoneResponse = await checkInTable(
        formattedQuery: formattedQuery,
        tableName: 'phone',
      );
      final emailResponse = await checkInTable(
        formattedQuery: formattedQuery,
        tableName: 'mail',
      );

      // Combine responses into a single list
      final List<Map<String, dynamic>> combinedResponse = [];
      combinedResponse
        ..addAll(phoneResponse)
        ..addAll(emailResponse);

      if (combinedResponse.isEmpty) {
        return Right(combinedResponse.map((json) => UserModel.fromJson(json)).toList());
      }

      // Convert to UserModel list and remove duplicates if needed
      final List<UserModel> users = combinedResponse
          .map((json) => UserModel.fromJson(json))
          .toList()
          .toSet()
          .toList();

      return Right(users);
    } catch (e) {
      if (e is CustomError) {
        return Left(e);
      }
      return Left(CustomError(LangKeys.error));
    }
  }

  Future<List<Map<String, dynamic>>> checkInTable({
    required String formattedQuery,
    required String tableName,
  }) async {
    try {
      final SupabaseServicesRepo supa = SupabaseServicesRepo();
      final response = await supa.supabase
          .from(BackendPoint.users)
          .select()
          .like(tableName, formattedQuery);

      return (response).map((item) => item).toList();
    } catch (e) {
      throw CustomError(LangKeys.error);
    }
  }
}
