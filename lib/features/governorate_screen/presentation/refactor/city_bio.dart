import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_shimmer.dart';
import '../cubits/city_bio_creator_cubit/city_bio_creator_cubit.dart';

class CityBio extends StatelessWidget {
  const CityBio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBioCreatorCubit, CityBioCreatorState>(
      builder: (context, state) {
        if (state is CityBioGenerated) {
          return _buildCityCreator(state, context);
        } else if (state is CityBioError) {
          return SliverToBoxAdapter(
            child: Center(child: AppText(state.error)),
          );
        }
        return _buildCityCreatorLoading();
      },
    );
  }

  SliverToBoxAdapter _buildCityCreator(
      CityBioGenerated state, BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppText(
          state.bio.trim(),
          maxLines: 20,
          textAlign: TextAlign.justify,
          height: 2,
          fontSize: context.bodySmall!.fontSize,
        ),
      ),
    );
  }

  Widget _buildCityCreatorLoading() {
    return SliverToBoxAdapter(
      child: ShimmerLoadingText(),
    );
  }
}
