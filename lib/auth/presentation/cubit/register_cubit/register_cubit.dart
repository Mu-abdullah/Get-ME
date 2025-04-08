import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/auth/data/models/create_user_model.dart';
import 'package:getme/auth/data/models/user_model.dart';
import 'package:getme/core/functions/input_validation.dart';

import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../../data/repo/create_user_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  CreateUserRepo repo;
  RegisterCubit(this.data, {required this.repo}) : super(RegisterInitial()) {
    checkDate();
  }
  static RegisterCubit get(context) => BlocProvider.of(context);
  final String data;
  final mailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void checkDate() {
    if (InputValidator.isEmail(data)) {
      mailCtrl.text = data;
    } else {
      phoneCtrl.text = data;
    }
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final response = await repo.createUser(
        date: {
          'name': nameCtrl.text,
          'phone': phoneCtrl.text,
          'mail': mailCtrl.text,
        },
      );
      response.fold(
        (error) => emit(RegisterError(error.message)),
        (user) => emit(RegisterSuccess(user)),
      );
    }
  }

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    final response = await repo.getUserData(phoneCtrl.text);
    response.fold((error) {
      emit(GetUserDataError(error.message));
    }, (user) async {
      await SharedPref.saveUserToPreferences(
        user: user.toJson(),
        key: PrefKeys.userModel,
      );
      SharedPref.saveData(
        key: PrefKeys.isSignedIn,
        value: true,
      );
      if (!isClosed) {
        emit(GetUserDataSuccess(user));
      }
    });
  }
}
