import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../core/language/lang_keys.dart';
import '../../../core/routes/routes_name.dart';
import '../../../core/style/widgets/custom_bottom_sheet.dart';
import '../../../core/style/widgets/custom_snack_bar.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
import '../widgets/auth/auth_button.dart';
import '../widgets/auth/auth_image.dart';
import '../widgets/auth/login_form.dart';
import '../widgets/register/regester_bottom_sheet.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UserFound) {
          CustomSnackbar.showTopSnackBar(
            context,
            message:
                "${context.translate(LangKeys.welcemeUser)} ${state.user.name}",
          );

          context.pushNamedAndRemoveUntil(RoutesNames.homeScreen);
        } else if (state is UserNotFound) {
          customShowBottomSheet(
              context: context,
              isScrollControlled: false,
              builder: (_) {
                return RegisterBottomSheet(data: state.data);
              });
          CustomSnackbar.showTopSnackBar(
            context,
            message: context.translate(LangKeys.userNotFound),
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        } else if (state is AuthError) {
          CustomSnackbar.showTopSnackBar(
            context,
            message: state.error,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      builder: (context, state) {
        final cubit = AuthCubit.get(context);
        return CustomScrollView(slivers: [
          AuthImage(),
          LoginForm(cubit: cubit),
          AuthButton(cubit: cubit),
        ]);
      },
    );
  }
}
