import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it/git_it.dart';
import '../../data/repo/get_home_city_repo.dart';
import '../../data/repo/get_home_governorates_repo.dart';
import '../../data/repo/home_places_repo.dart';
import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../cubits/home_cities_cubit/home_cities_cubit.dart';
import '../cubits/home_governorates_cubit/home_governorates_cubit.dart';
import '../cubits/home_places_cubit/home_places_cubit.dart';
import '../refactor/bottom_bar_body.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key, this.phone});
  final String? phone;
  @override
  Widget build(BuildContext context) {
    final lactor = locator<GetHomeGovernoratesRepo>();
    final cityLactor = locator<GetHomeCityRepo>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomBarCubit(),
        ),
        BlocProvider(
          create: (context) => HomeGovernoratesCubit(lactor),
        ),
        BlocProvider(
          create: (context) => HomeCitiesCubit(cityLactor),
        ),
        BlocProvider(
          create: (context) => PlacesCubit(PlacesRepository()),
        ),
      ],
      child: BottomBarBody(),
    );
  }
}
