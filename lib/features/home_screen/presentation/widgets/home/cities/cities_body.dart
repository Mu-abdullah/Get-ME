import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../cubits/home_cities_cubit/home_cities_cubit.dart';
import '../home_section_header.dart';
import '../home_section_loading.dart';
import 'cities_listview.dart';

class HomeCities extends StatelessWidget {
  const HomeCities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCitiesCubit, HomeCitiesState>(
        builder: (context, state) {
      if (state is LoadingCity) {
        return const HomeSectionLoading(title: LangKeys.cities);
      } else if (state is ErrorGetCity) {
        return Center(child: AppText(state.message));
      } else if (state is CityLoaded) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppBorderRadius.mediumRadius,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSpace(space: 5),
              HomeSectionHeader(
                title: LangKeys.cities,
                onTap: () {},
              ),
              Expanded(
                child: HomeCitiesListview(cities: state.cities),
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
