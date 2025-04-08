import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/services/get_it/git_it.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/governorates_repo.dart';
import '../cubits/governorates_cubit/governorates_cubit.dart';
import '../refactor/all_governorates_gridview_body.dart';

class GovernoratesGridViewScreen extends StatelessWidget {
  const GovernoratesGridViewScreen({super.key, this.isAddedPlace});
  final bool? isAddedPlace;
  @override
  Widget build(BuildContext context) {
    final repo = locator<GetGovernoratesRepo>();
    return BlocProvider(
      create: (context) => GovernoratesCubit(
        repo,
        isAddedPlace: isAddedPlace ?? false,
      )..getGovernorates(),
      child: Scaffold(
        appBar: CustomAppBar(
          translatedTitle: isAddedPlace == true
              ? LangKeys.chooseGovernorate
              : LangKeys.governorates,
        ),
        body: GovernoratesGridGridviewBody(),
      ),
    );
  }
}
