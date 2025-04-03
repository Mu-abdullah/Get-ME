import 'package:flutter/material.dart';
import 'package:getme/features/on_board/on_boarding_screen.dart';

import '../../features/account_screen/presentation/views/account_screen.dart';
import '../../features/add_new_place/presentation/views/add_new_place.dart';
import '../../features/governorate_screen/presentation/views/governorate_screen.dart';
import '../../features/home_screen/data/model/governorates_model.dart';
import '../../features/home_screen/data/model/places_model.dart';
import '../../features/all_governorate/presentation/views/governorates_grid_view_screen.dart';
import '../../features/home_screen/presentation/views/home_screen.dart';
import '../../features/all_places/presentation/views/places_grid_view_screen.dart';
import '../../features/place_screen/presentation/views/place_screen.dart';
import '../../features/policy/presentation/views/policy_screen.dart';
import '../app/image/image_preview.dart';
import '../app/language/language_screen.dart';
import '../app/no_internet/no_internet_screen.dart';
import 'base_routes.dart';
import 'routes_name.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments as Map<String, dynamic>?;

  switch (settings.name) {
    case RoutesNames.imagePreview:
      return BaseRoute(
        page: PreviewImage(
          imageUrl: args?['imageUrl'] as String?,
          title: args?['title'] as String?,
          imagesList:
              (args?['imagesList'] as List?)?.whereType<String>().toList(),
        ),
      );

    case RoutesNames.language:
      return BaseRoute(
        page: LanguageScreen(),
      );

    case RoutesNames.onBoarding:
      return BaseRoute(
        page: OnBoardingScreen(),
      );

    case RoutesNames.noInternet:
      return BaseRoute(
        page: NoInternetScreen(),
      );

    case RoutesNames.governorateScreen:
      return BaseRoute(
        page: GovernorateScreen(
          governorate: args!['governorate'] as GovernoratesModel,
        ),
      );
    case RoutesNames.governorate:
      return BaseRoute(
        page: GovernoratesGridViewScreen(),
      );
    case RoutesNames.allPlaces:
      return BaseRoute(
        page: AllPlacesScreen(),
      );

    case RoutesNames.policyScreen:
      return BaseRoute(
        page: PolicyScreen(),
      );
    case RoutesNames.addPlaceScreen:
      return BaseRoute(
        page: AddNewPlace(
          governorate: args?['governorate'] as GovernoratesModel?,
        ),
      );

    case RoutesNames.homeScreen:
      return BaseRoute(
        page: HomeScreen(),
      );
    case RoutesNames.placeScreen:
      return BaseRoute(
        page: PlaceScreen(
          images: args!['images'],
          place: args['place'] as PlacesModel,
        ),
      );

    case RoutesNames.accountScreen:
      return BaseRoute(
        page: AccountScreen(),
      );

    default:
      return BaseRoute(page: const MaterialApp());
  }
}
