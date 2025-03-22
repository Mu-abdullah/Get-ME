import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../cubits/home_governorates_cubit/home_governorates_cubit.dart';
import '../home_section_header.dart';
import '../home_section_loading.dart';
import 'governorates_listview.dart';

class Governorates extends StatelessWidget {
  const Governorates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeGovernoratesCubit, HomeGovernoratesState>(
        builder: (context, state) {
      if (state is LoadingGovernorates) {
        return const HomeSectionLoading(title: LangKeys.governorates);
      } else if (state is ErrorGetGovernorates) {
        return Center(child: AppText(state.message));
      } else if (state is GovernoratesLoaded) {
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
                title: LangKeys.governorates,
                onTap: () {
                  context.pushNamed(RoutesNames.governorate);
                },
              ),
              Expanded(
                child: GovernoratesListview(cities: state.cities),
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
