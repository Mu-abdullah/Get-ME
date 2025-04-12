import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/user_place_repo.dart';
import '../cubits/cubit/user_places_cubit.dart';
import '../refactor/user_place_body.dart';

class UserPlaces extends StatelessWidget {
  const UserPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserPlacesCubit(UserPlacesRepository())..loadPlaces(),
      child: Scaffold(
        appBar: CustomAppBar(
          translatedTitle: LangKeys.myPlaces,
        ),
        body: UserPlacesBody(),
      ),
    );
  }
}
