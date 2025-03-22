import 'package:flutter/material.dart';

import '../../../../data/model/governorates_model.dart';
import 'governorates_item.dart';

class GovernoratesListview extends StatelessWidget {
  const GovernoratesListview({
    super.key,
    required this.cities,
  });
  final List<GovernoratesModel> cities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: cities.length,
      itemBuilder: (_, index) {
        final city = cities[index];
        return GovernoratesItem(governorate: city);
      },
    );
  }
}
