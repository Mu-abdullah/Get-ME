import 'package:flutter/material.dart';
import 'package:getme/features/home/presentation/views/home_screen.dart';
import 'package:getme/features/policy/policy_screen.dart';

import 'base_routes.dart';
import 'routes_name.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // final args = settings.arguments as Map<String, dynamic>?;

  switch (settings.name) {
    case RoutesNames.homeScreen:
      return BaseRoute(
        page: HomeScreen(),
      );

    case RoutesNames.policyScreen:
      return BaseRoute(
        page: PolicyScreen(),
      );
    default:
      return BaseRoute(page: const MaterialApp());
  }
}
