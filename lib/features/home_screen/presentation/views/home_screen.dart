import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it/git_it.dart';
import '../../data/repo/get_home_cities_repo.dart';
import '../../data/repo/places_repo.dart';
import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../cubits/home_governorates_cubit/home_governorates_cubit.dart';
import '../cubits/home_places_cubit/home_places_cubit.dart';
import '../refactor/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lactor = locator<GetHomeCitiesRepo>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomBarCubit(),
        ),
        BlocProvider(
          create: (context) => HomeGovernoratesCubit(lactor),
        ),
        BlocProvider(
          create: (context) => PlacesCubit(PlacesRepository()),
        ),
      ],
      child: HomeBody(),
    );
  }
}
