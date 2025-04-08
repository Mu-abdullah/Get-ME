import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/services/shared_pref/pref_keys.dart';
import 'package:getme/core/services/shared_pref/shared_pref.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repo/auth_user_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthUserRepo userRepo = AuthUserRepo();
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();

  final authCtrl = TextEditingController();

  void checkUser() async {
    emit(AuthLoading());
    var user = await userRepo.getUser(searchQuery: authCtrl.text);

    user.fold(
      (error) {
        emit(AuthError(error.message));
      },
      (user) {
        if (user.isEmpty) {
          debugPrint("User not found");
          emit(UserNotFound(data: authCtrl.text));
          return;
        } else {
          debugPrint("User found");
          debugPrint("User found ${user.first.toJson()} + ${user.length}");
          SharedPref.saveUserToPreferences(
            user: user.first.toJson(),
            key: PrefKeys.userModel,
          );
          SharedPref.saveData(
            key: PrefKeys.isSignedIn,
            value: true,
          );

          emit(UserFound(
            user: user.first,
          ));
        }
      },
    );
  }
}
