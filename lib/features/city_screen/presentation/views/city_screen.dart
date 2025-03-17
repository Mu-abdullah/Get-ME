import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_screen/data/model/city_model.dart';
import '../../data/repo/city_places.dart';
import '../cubits/city_bio_creator_cubit/city_bio_creator_cubit.dart';
import '../cubits/get_city_places_cubit/get_city_places_cubit.dart';
import '../refactor/city_body.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({
    super.key,
    required this.city,
  });
  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CityBioCreatorCubit()..generateCityBio(city.name!),
        ),
        BlocProvider(
          create: (context) => GetCityPlacesCubit(
            repo: CityPlacesRepo(),
            cityId: city.id!,
          ),
        ),
      ],
      child: Scaffold(
        // floatingActionButton: AddNewPlaceFloatingButton(city: city),
        body: CityBody(city: city),
      ),
    );
  }
}
