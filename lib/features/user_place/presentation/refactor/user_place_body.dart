import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/style/widgets/app_text.dart';

import '../../../../core/language/lang_keys.dart';
import '../cubits/cubit/user_places_cubit.dart';
import '../widgets/user_place_item.dart';
import '../widgets/user_place_loading.dart';

class UserPlacesBody extends StatelessWidget {
  const UserPlacesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPlacesCubit, UserPlacesState>(
      builder: (context, state) {
        if (state is UserPlacesLoading) {
          return UserPlaceLoading();
        } else if (state is UserPlacesLoaded) {
          if (state.placesWithImages.isEmpty) {
            return Center(
              child: AppText(LangKeys.noPlaces),
            );
          } else {
            return ListView.builder(
              itemBuilder: (_, index) {
                final place = state.placesWithImages.keys.elementAt(index);
                final images = state.placesWithImages[place]!;
                return UserPlaceItem(
                  item: place,
                  images: images,
                );
              },
              itemCount: state.placesWithImages.length,
            );
          }
        } else if (state is UserPlacesError) {}
        return Container();
      },
    );
  }
}
