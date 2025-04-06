import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/services/get_it/git_it.dart';
import '../../../../core/style/widgets/app_button.dart';
import '../../../../core/style/widgets/app_space.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_snack_bar.dart';
import '../../../data/repo/create_user_repo.dart';
import '../../cubit/register_cubit/register_cubit.dart';
import 'register_form.dart';

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet({
    super.key,
    required this.data,
  });
  final String data;

  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var lac = locator<CreateUserRepo>();
    return BlocProvider(
      create: (context) => RegisterCubit(widget.data, repo: lac),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterError) {
            CustomSnackbar.showTopSnackBar(
              context,
              message: state.error.isEmpty ? LangKeys.error : state.error,
            );
          } else if (state is RegisterSuccess) {
            CustomSnackbar.showTopSnackBar(
              context,
              message:
                  "${context.translate(LangKeys.welcemeUser)} ${state.user.name}",
            );
            Navigator.pop(context);
            context.pushNamedAndRemoveUntil(RoutesNames.homeScreen);
          }
        },
        builder: (context, state) {
          final cubit = RegisterCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  AppSpace(),
                  AppText(
                    context.translate(LangKeys.register),
                    isTitle: true,
                  ),
                  RegisterForm(cubit: cubit),
                  AppButton(
                      isLoading: state is RegisterLoading,
                      onTap: () async {
                        cubit.register().then((value) {
                          cubit.getUserData();
                        });
                      },
                      text: LangKeys.register),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
