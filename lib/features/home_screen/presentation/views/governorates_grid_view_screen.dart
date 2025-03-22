import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/services/get_it/git_it.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/cities_repo.dart';
import '../cubits/governorates_cubit/cities_cubit.dart';
import '../refactor/all_governorates_gridview_body.dart';

class GovernoratesGridViewScreen extends StatelessWidget {
  const GovernoratesGridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = locator<GetCitiesRepo>();
    return BlocProvider(
      create: (context) => CitiesCubit(repo)..getCities(),
      child: Scaffold(
        appBar: CustomAppBar(
          translatedTitle: LangKeys.governorates,
        ),
        body: CitiesGridviewBody(),
      ),
    );
  }
}
