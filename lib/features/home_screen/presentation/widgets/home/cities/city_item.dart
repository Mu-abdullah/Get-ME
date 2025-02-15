import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/routes/routes_name.dart';
import 'package:getme/core/style/color/color_light.dart';
import 'package:getme/core/style/widgets/app_text.dart';

import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../data/model/city_model.dart';

class CityItem extends StatelessWidget {
  const CityItem({
    super.key,
    required this.city,
  });

  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(RoutesNames.cityScreen, arguments: {
          'city': city,
        });
      },
      borderRadius: AppBorderRadius.mediumRadius,
      child: Container(
        width: 250,
        margin: AppPadding.smallPadding,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.mediumRadius,
          image: DecorationImage(
            image: NetworkImage(city.image!),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            _buildGradientOverlay(),
            _buildBlurEffect(),
            _buildCityInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.mediumRadius,
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [
              Colors.black.withValues(alpha: 0.8),
              Colors.transparent,
            ],
            stops: const [0, 1],
          ),
        ),
      ),
    );
  }

  Widget _buildBlurEffect() {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: AppBorderRadius.mediumRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget _buildCityInfo() {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            city.nameAr!,
            color: ColorsLight.white,
            isTitle: true,
          ),
        ],
      ),
    );
  }
}
