import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/governorates_cubit/governorates_cubit.dart';
import '../widgets/all_governorates_loading.dart';
import '../widgets/governorates_gridview.dart';

class GovernoratesGridGridviewBody extends StatelessWidget {
  const GovernoratesGridGridviewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GovernoratesCubit, GovernoratesState>(
      builder: (context, state) {
        if (state is LoadingGovernorates) {
          return AllCitiesLoading();
        } else if (state is ErrorGetGovernorates) {
          return Center(child: Text(state.message));
        } else if (state is GovernoratesLoaded) {
          return GovernoratesGridView(
            governorates: state.cities,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
