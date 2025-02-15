import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/services/get_it/git_it.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/cities_repo.dart';
import '../cubits/cities_cubit/cities_cubit.dart';
import '../refactor/all_cities_gridview_body.dart';

class CitiesGridViewScreen extends StatelessWidget {
  const CitiesGridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = locator<GetCitiesRepo>();
    return BlocProvider(
      create: (context) => CitiesCubit(repo)..getCities(),
      child: Scaffold(
        appBar: CustomAppBar(
          translatedTitle: LangKeys.cities,
        ),
        body: CitiesGridviewBody(),
      ),
    );
  }
}
