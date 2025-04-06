import 'package:dartz/dartz.dart';
import 'package:getme/core/language/lang_keys.dart';
import 'package:getme/core/services/supabase/backend_points.dart';
import 'package:getme/core/services/supabase/data_services.dart';

import '../../../core/error/custom_errors.dart';
import '../models/create_user_model.dart';
import '../models/user_model.dart';
import 'auth_user_repo.dart';

class CreateUserRepo {
  DataService dataService;
  CreateUserRepo(this.dataService);
  Future<Either<CustomError, CreateUserModel>> createUser({
    required Map<String, dynamic> date,
  }) async {
    final response = await dataService.addData(
      table: BackendPoint.users,
      fromJson: (json) => json,
      data: date,
    );

    return response.fold(
      (error) => Left(error),
      (serverResponse) {
        final createUserModel = CreateUserModel.fromJson(serverResponse);
        return Right(createUserModel);
      },
    );
  }

  Future<Either<CustomError, UserModel>> getUserData(phone) async {
    AuthUserRepo authUserRepo = AuthUserRepo();
    var response = await authUserRepo.getUser(searchQuery: phone);
    return response.fold(
      (error) => throw error,
      (user) {
        if (user.isEmpty) {
          return left(CustomError(LangKeys.userNotFound));
        } else {
          return right(user.first);
        }
      },
    );
  }
}
