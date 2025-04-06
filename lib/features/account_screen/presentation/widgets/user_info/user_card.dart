import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/style/widgets/app_text.dart';
import '../../cubits/cubit/account_cubit.dart';
import 'card_loading.dart';
import 'user_info.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return UserInfo(
            user: state.userModel,
          );
        } else if (state is GetUserError) {
          return Center(child: AppText(state.message));
        } else if (state is GetUserLoading) {
          CardLoading();
        }
        return Container();
      },
    );
  }
}
