import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/city_model.dart';

class GridViewCityItem extends StatelessWidget {
  const GridViewCityItem({
    super.key,
    required this.city,
  });

  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        RoutesNames.cityScreen,
        arguments: {
          'city': city,
        },
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(city.image!),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withValues(alpha: 0.5),
              ),
            ),
            Center(
              child: AppText(
                city.nameAr!,
                color: Colors.white,
                isTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
