import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_button.dart';
import '../../../../core/style/widgets/custom_snack_bar.dart';
import '../../cubit/auth_cubit/auth_cubit.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppButton(
              isLoading: cubit.state is AuthLoading,
              text: LangKeys.login,
              onTap: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.checkUser();
                } else {
                  CustomSnackbar.showTopSnackBar(
                    context,
                    message: context.translate(LangKeys.requiredValue),
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}