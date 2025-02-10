import 'package:flutter/material.dart';

import '../../../../data/model/city_model.dart';
import 'city_item.dart';

class CitiesListview extends StatelessWidget {
  const CitiesListview({
    super.key,
    required this.cities,
  });
  final List<CityModel> cities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: cities.length,
      itemBuilder: (_, index) {
        final city = cities[index];
        return CityItem(city: city);
      },
    );
  }
}