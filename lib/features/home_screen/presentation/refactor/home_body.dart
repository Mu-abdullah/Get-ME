import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/widgets/custom_app_bar.dart';
import '../cubits/cubit/home_cubit.dart';
import '../widgets/home_bottom_nav_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
            translatedTitle: cubit.title[cubit.currentIndex],
            isBack: false,
          ),
          bottomNavigationBar: HomeBottomNavigationBar(cubit: cubit),
          body: SafeArea(child: cubit.screens[cubit.currentIndex]),
        );
      },
    );
  }
}
