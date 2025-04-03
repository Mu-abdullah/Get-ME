import 'package:flutter/material.dart';

import '../../../../core/style/font/fonts_helper.dart';
import '../../../../core/style/widgets/custom_divider.dart';
import '../../../home_screen/data/model/governorates_model.dart';
import '../widgets/city_places_widget.dart';
import '../widgets/city_places_title.dart';
import 'governorate_bio.dart';
import 'governorate_sliver_app_bar.dart';

class GovernorateBody extends StatelessWidget {
  const GovernorateBody({
    super.key,
    required this.city,
  });

  final GovernoratesModel city;

  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    double divider = 20;
    return CustomScrollView(
      slivers: [
        GovernorateSliverAppBar(
          imageUrl: city.image!,
          name: isArabic ? city.nameAr! : city.name!,
        ),
        const GovernorateBio(),
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
