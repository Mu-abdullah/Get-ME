import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_screen/data/model/city_model.dart';
import '../cubits/cubit/city_bio_creator_cubit.dart';
import '../refactor/city_body.dart';
import '../widgets/add_new_palce_floating_button.dart';

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
      ],
      child: Scaffold(
        floatingActionButton: AddNewPlaceFloatingButton(city: city),
        body: CityBody(city: city),
      ),
    );
  }
}
