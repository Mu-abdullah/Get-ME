import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';

import '../cubits/places_cubit/places_cubit.dart';
import '../refactor/all_places_gridview_body.dart';

class PlacesGridViewScreen extends StatelessWidget {
  const PlacesGridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          translatedTitle: LangKeys.places,
        ),
        body: AllPlacesGridviewBody(),
      ),
    );
  }
}
