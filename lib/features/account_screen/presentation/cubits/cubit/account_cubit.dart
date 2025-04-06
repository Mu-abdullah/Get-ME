import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../auth/data/models/user_model.dart';
import '../../../data/repo/get_user_from_shared.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  GetUserFromShared getUserFromShared;
  AccountCubit(this.getUserFromShared) : super(AccountInitial()) {
    getUser();
  }

  static AccountCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  Future<void> getUser() async {
    emit(GetUserLoading());
    userModel = await getUserFromShared.getUser();
    if (userModel != null) {
      emit(GetUserSuccess(userModel!));
    } else {
      emit(GetUserError("No user found"));
    }
  }
}
