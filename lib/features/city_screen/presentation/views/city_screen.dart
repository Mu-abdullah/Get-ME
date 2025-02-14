import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/style/widgets/app_text.dart';
import '../../../home_screen/data/model/city_model.dart';
import '../refactor/blogger_sliver_app_bar.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({
    super.key,
    required this.city,
  });
  final CityModel city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CitySliverAppBar(imageUrl: city.image!, name: city.nameAr!),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppText(
                city.aboutCity!,
                maxLines: 20,
                textAlign: TextAlign.justify,
                height: 2,
                fontSize: context.bodySmall!.fontSize,
              ),
            ),
          ),
          // SliverFillRemaining(child: Container()),
        ],
      ),
    );
  }
}
