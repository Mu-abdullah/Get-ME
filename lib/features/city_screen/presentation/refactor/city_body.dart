import 'package:flutter/material.dart';

import '../../../home_screen/data/model/city_model.dart';
import '../widgets/city_places.dart';
import '../widgets/city_places_title.dart';
import 'city_bio.dart';
import 'city_sliver_app_bar.dart';

class CityBody extends StatelessWidget {
  const CityBody({
    super.key,
    required this.city,
  });

  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CitySliverAppBar(imageUrl: city.image!, name: city.nameAr!),
        const CityBio(),
        CityPlacesTitle(),
        CityPlaces(),
      ],
    );
  }
}
