import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_screen/data/model/governorates_model.dart';
import '../../data/repo/city_places.dart';
import '../cubits/city_bio_creator_cubit/city_bio_creator_cubit.dart';
import '../cubits/get_city_places_cubit/get_city_places_cubit.dart';
import '../refactor/city_body.dart';
import '../widgets/add_new_palce_floating_button.dart';

class GovernorateScreen extends StatelessWidget {
  const GovernorateScreen({
    super.key,
    required this.governorate,
  });
  final GovernoratesModel governorate;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CityBioCreatorCubit()..generateCityBio(governorate.nameAr!),
        ),
        BlocProvider(
          create: (context) => GetCityPlacesCubit(
            repo: CityPlacesRepo(),
            city: governorate,
          ),
        ),
      ],
      child: Scaffold(
        floatingActionButton:
            AddNewPlaceFloatingButton(governorate: governorate),
        body: CityBody(city: governorate),
      ),
    );
  }
}
