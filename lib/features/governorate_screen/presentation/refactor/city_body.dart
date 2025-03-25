import 'package:flutter/material.dart';

import '../../../../core/style/widgets/custom_divider.dart';
import '../../../home_screen/data/model/governorates_model.dart';
import '../widgets/city_places.dart';
import '../widgets/city_places_title.dart';
import 'city_bio.dart';
import 'city_sliver_app_bar.dart';

class CityBody extends StatelessWidget {
  const CityBody({
    super.key,
    required this.city,
  });

  final GovernoratesModel city;

  @override
  Widget build(BuildContext context) {
    double divider = 20;
    return CustomScrollView(
      slivers: [
        CitySliverAppBar(imageUrl: city.image!, name: city.nameAr!),
        const CityBio(),
        SliverToBoxAdapter(
          child: CustomDivider(
            endIndent: divider,
            indent: divider,
          ),
        ),
        CityPlacesTitle(),
        CityPlaces(),
      ],
    );
  }
}
