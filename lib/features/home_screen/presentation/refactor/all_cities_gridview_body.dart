import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cities_cubit/cities_cubit.dart';
import '../widgets/all_cities/all_cities_loading.dart';
import '../widgets/all_cities/cities_gridview.dart';

class CitiesGridviewBody extends StatelessWidget {
  const CitiesGridviewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesCubit, CitiesState>(
      builder: (context, state) {
        if (state is LoadingCities) {
          return AllCitiesLoading();
        } else if (state is ErrorGetCities) {
          return Center(child: Text(state.message));
        } else if (state is CitiesLoaded) {
          return CitiesGridView(
            cities: state.cities,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
