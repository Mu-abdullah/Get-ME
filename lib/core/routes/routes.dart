import 'package:flutter/material.dart';
 
import '../../features/account_screen/presentation/views/account_screen.dart';
import '../../features/add_new_place/presentation/views/add_new_place.dart';
import '../../features/city_screen/presentation/views/city_screen.dart';
import '../../features/home_screen/data/model/city_model.dart';
import '../../features/home_screen/presentation/views/cities_grid_view_screen.dart';
import '../../features/home_screen/presentation/views/home_screen.dart';
import '../../features/policy/presentation/views/policy_screen.dart';
import '../app/image/image_preview.dart';
import 'base_routes.dart';
import 'routes_name.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments as Map<String, dynamic>?;

  switch (settings.name) {
    case RoutesNames.imagePreview:
      return BaseRoute(
        page: PreviewImage(
          imageUrl: args!['imageUrl'] as String,
          title: args['title'] as String?,
        ),
      );
    case RoutesNames.cityScreen:
      return BaseRoute(
        page: CityScreen(
          city: args!['city'] as CityModel,
        ),
      );
    case RoutesNames.cities:
      return BaseRoute(
        page: CitiesGridViewScreen(),
      );

    case RoutesNames.policyScreen:
      return BaseRoute(
        page: PolicyScreen(),
      );
    case RoutesNames.addPlaceScreen:
      return BaseRoute(
        page: AddNewPlace(),
      );

    case RoutesNames.homeScreen:
      return BaseRoute(
        page: HomeScreen(),
      );

    case RoutesNames.accountScreen:
      return BaseRoute(
        page: AccountScreen(),
      );

    default:
      return BaseRoute(page: const MaterialApp());
  }
}
