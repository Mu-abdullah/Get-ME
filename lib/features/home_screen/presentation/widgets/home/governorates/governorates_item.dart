import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/routes/routes_name.dart';
import 'package:getme/core/style/color/color_light.dart';
import 'package:getme/core/style/widgets/app_text.dart';

import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../data/model/governorates_model.dart';

class GovernoratesItem extends StatelessWidget {
  const GovernoratesItem({
    super.key,
    required this.governorate,
  });

  final GovernoratesModel governorate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(RoutesNames.governorateScreen, arguments: {
          'governorate': governorate,
        });
      },
      borderRadius: AppBorderRadius.mediumRadius,
      child: Container(
        width: 250,
        margin: AppPadding.smallPadding,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.mediumRadius,
          image: DecorationImage(
            image: NetworkImage(governorate.image!),
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
            governorate.nameAr!,
            color: ColorsLight.white,
            isTitle: true,
          ),
        ],
      ),
    );
  }
}
