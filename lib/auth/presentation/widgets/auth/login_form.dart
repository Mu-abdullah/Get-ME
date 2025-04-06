import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/functions/input_validation.dart';
import '../../../../core/language/lang_keys.dart';
import '../../cubit/auth_cubit/auth_cubit.dart';
import 'auth_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        key: cubit.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AuthFormField(
            controller: cubit.authCtrl,
            type: TextInputType.text,
            hint: context.translate(LangKeys.authHint),
            prefix: Icon(HugeIcons.strokeRoundedSmartPhone01),
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              } else if (Validator.validatePhoneOrEmail(v) != null) {
                return "${context.translate(LangKeys.writeEmailCorrect)}\n${context.translate(LangKeys.writePhoneCorrect)}";
              }
      
              return null;
            },
          ),
        ),
      ),
    );
  }
}
