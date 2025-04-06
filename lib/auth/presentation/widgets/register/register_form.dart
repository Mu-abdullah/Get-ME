import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../cubit/register_cubit/register_cubit.dart';
import '../auth/auth_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        spacing: 10,
        children: [
          
          AuthFormField(
            controller: cubit.nameCtrl,
            type: TextInputType.text,
            hint: context.translate(LangKeys.name),
            prefix: Icon(HugeIcons.strokeRoundedUser),
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
      
              return null;
            },
          ),
          AuthFormField(
            controller: cubit.mailCtrl,
            type: TextInputType.text,
            hint: context.translate(LangKeys.email),
            prefix: Icon(HugeIcons.strokeRoundedMail01),
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
      
              return null;
            },
          ),
          AuthFormField(
            controller: cubit.phoneCtrl,
            type: TextInputType.number,
            hint: context.translate(LangKeys.phone),
            prefix: Icon(HugeIcons.strokeRoundedSmartPhone01),
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
      
              return null;
            },
          ),
        ],
      ),
    );
  }
}
