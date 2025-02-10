import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/features/home_screen/presentation/cubits/city_cubit/city_cubit.dart';

import '../../../../core/services/get_it/git_it.dart';
import '../../data/repo/get_cities_repo.dart';
import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../refactor/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lactor = locator<GetCitiesRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomBarCubit(),
        ),
        BlocProvider(
          create: (context) => CityCubit(lactor),
        ),
      ],
      child: HomeBody(),
    );
  }
}
