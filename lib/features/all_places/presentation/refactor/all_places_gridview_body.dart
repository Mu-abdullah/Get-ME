import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/statics/app_statics.dart';
import '../cubits/places_cubit/places_cubit.dart';
import '../../../all_governorate/presentation/widgets/all_governorates_loading.dart';
import '../../../home_screen/presentation/widgets/home/places/place_item.dart';

class AllPlacesGridviewBody extends StatelessWidget {
  const AllPlacesGridviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        if (state is PlacesLoading) {
          return AllCitiesLoading();
        } else if (state is PlacesError) {
          return Center(child: Text(state.message));
        } else if (state is PlacesLoaded) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 9 / 10,
            ),
            padding: AppPadding.mediumPadding,
            itemCount: state.placesWithImages.length,
            itemBuilder: (context, index) {
              final place = state.placesWithImages.keys.elementAt(index);
              final images = state.placesWithImages[place]!;
              return PlaceCard(
                place: place,
                images: images,
                needMargin: false,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
