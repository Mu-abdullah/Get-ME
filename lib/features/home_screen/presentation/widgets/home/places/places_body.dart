import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/no_place_found.dart';
import '../../../cubits/home_places_cubit/home_places_cubit.dart';
import '../home_section_header.dart';
import '../home_section_loading.dart';
import 'place_item.dart';

class PlacesBody extends StatelessWidget {
  const PlacesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, HomePlacesState>(
      builder: (context, state) {
        if (state is PlacesLoading) {
          return const HomeSectionLoading(title: LangKeys.places);
        } else if (state is PlacesLoaded) {
          if (state.placesWithImages.isEmpty) {
            return NoPlaceFound();
          }
          return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppBorderRadius.mediumRadius,
              ),
              child: Column(
                children: [
                  const AppSpace(space: 5),
                  HomeSectionHeader(
                    title: LangKeys.places,
                    onTap: () {
                      context.pushNamed(RoutesNames.allPlaces);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.placesWithImages.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final place =
                            state.placesWithImages.keys.elementAt(index);
                        final images = state.placesWithImages[place]!;
                        return PlaceCard(place: place, images: images);
                      },
                    ),
                  ),
                ],
              ));
        } else if (state is PlacesError) {
          return Center(child: Text(state.message));
        }
        return Container(
          color: Colors.red,
          child: const Center(child: Text('Unexpected Error')),
        );
      },
    );
  }
}
