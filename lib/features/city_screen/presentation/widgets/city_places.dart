import 'package:flutter/material.dart';
import 'package:getme/core/style/widgets/app_text.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/statics/image_test.dart';

class CityPlaces extends StatelessWidget {
  const CityPlaces({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 4 / 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: AppBorderRadius.mediumRadius,
                ),
                child: Center(
                  child: Stack(
                    children: [
                      RotationTransition(
                        turns: const AlwaysStoppedAnimation(10 / 360),
                        child: _buildImage(ImageTest.bloger),
                      ),
                      RotationTransition(
                        turns: const AlwaysStoppedAnimation(360 / 300),
                        child: _buildImage(ImageTest.bloger),
                      ),
                      _buildImage(ImageTest.bloger),
                    ],
                  ),
                ),
              ),
              AppText("place name")
            ],
          );
        },
        childCount: 20, // Number of grid items
      ),
    );
  }

  Container _buildImage(
    String image,
  ) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: AppBorderRadius.mediumRadius,
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
