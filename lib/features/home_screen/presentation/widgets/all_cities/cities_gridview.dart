import 'package:flutter/material.dart';

import '../../../data/model/city_model.dart';
import 'city_gridview_item.dart';

class CitiesGridView extends StatelessWidget {
  const CitiesGridView({
    super.key,
    required this.cities,
  });
  final List<CityModel> cities;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: cities.length,
      itemBuilder: (context, index) {
        final city = cities[index];
        return GridViewCityItem(city: city);
      },
    );
  }
}
