import 'package:flutter/material.dart';
import 'package:getme/features/blogger_screen/presentation/views/blogger_screen.dart';
import 'package:getme/features/policy/policy_screen.dart';

import 'base_routes.dart';
import 'routes_name.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // final args = settings.arguments as Map<String, dynamic>?;

  switch (settings.name) {
    case RoutesNames.bloggerScreen:
      return BaseRoute(
        page: BloggerScreen(),
      );

    case RoutesNames.policyScreen:
      return BaseRoute(
        page: PolicyScreen(),
      );
    default:
      return BaseRoute(page: const MaterialApp());
  }
}
