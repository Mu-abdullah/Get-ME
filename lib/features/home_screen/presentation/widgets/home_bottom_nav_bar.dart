import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
    required this.cubit,
  });

  final BottomBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      items: cubit.items(context),
      onItemSelected: cubit.changeIndex,
      selectedIndex: cubit.currentIndex,
      animationCurve: Curves.bounceInOut,
      shadows: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          offset: Offset(0, 1),
        ),
      ],
      showElevation: true,
      height: 55,
    );
  }
}
