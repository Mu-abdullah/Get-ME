import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../cubits/city_cubit/city_cubit.dart';
import '../home_section_header.dart';
import '../home_section_loading.dart';
import 'city_listview.dart';

class Cities extends StatelessWidget {
  const Cities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(builder: (context, state) {
      if (state is LoadingCities) {
        return const HomeSectionLoading();
      } else if (state is ErrorGetCities) {
        return Center(child: AppText(state.message));
      } else if (state is CitiesLoaded) {
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
                child: CitiesListview(cities: state.cities),
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
