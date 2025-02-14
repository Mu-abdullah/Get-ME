import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it/git_it.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../../../core/language/lang_keys.dart';
import '../../data/repo/policy_repo.dart';
import '../cubits/cubit/policy_cubit.dart';
import '../refactor/policy_body.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lac = locator<PolicyRepo>();
    return BlocProvider(
      create: (context) => PolicyCubit(lac)..getPolicy(),
      child: Scaffold(
        appBar: CustomAppBar(
          translatedTitle: LangKeys.policy,
        ),
        body: PolicyBody(),
      ),
    );
  }
}
