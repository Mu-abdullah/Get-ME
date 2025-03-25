import 'package:flutter/material.dart';

import '../../../../data/model/home_get_cities_model.dart';
import 'cities_item.dart';

class HomeCitiesListview extends StatelessWidget {
  const HomeCitiesListview({
    super.key,
    required this.cities,
  });
  final List<HomeGetCitiesModel> cities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: cities.length,
      itemBuilder: (_, index) {
        final city = cities[index];
        return CitiesItem(city: city);
      },
    );
  }
}
