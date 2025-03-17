import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/no_place_found.dart';
import '../cubits/get_city_places_cubit/get_city_places_cubit.dart';
import 'loading_city_places.dart';

class CityPlaces extends StatelessWidget {
  const CityPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCityPlacesCubit, GetCityPlacesState>(
      builder: (context, state) {
        var city = GetCityPlacesCubit.get(context);
        if (state is GetCityPlacesLoading) {
          return LoadingCityPlaces();
        } else if (state is GetCityPlacesLoaded) {
          if (state.places.isEmpty) {
            return SliverToBoxAdapter(
              child: NoPlaceFound(
                city: city.city,
              ),
            );
          }
          return _sliverGridView(state);
        } else if (state is GetCityPlacesError) {
          return SliverToBoxAdapter(
            child: Center(
              child: AppText(state.message, color: Colors.red),
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }

  SliverGrid _sliverGridView(GetCityPlacesLoaded state) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 4 / 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final place = state.places.keys.elementAt(index);
          final images = state.places[place]!;
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: AppBorderRadius.mediumRadius,
                ),
                child: Center(
                  child: Stack(
                    children: [
                      _buildRotatedImage(images[0].url!, 10 / 360),
                      _buildRotatedImage(images[0].url!, 360 / 300),
                      _buildImage(images[0].url!),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              AppText(place.name!, color: Colors.black, fontSize: 16),
            ],
          );
        },
        childCount: state.places.length,
      ),
    );
  }

  Widget _buildRotatedImage(String image, double rotation) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(rotation),
      child: _buildImage(image),
    );
  }

  Widget _buildImage(String image) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: AppBorderRadius.mediumRadius,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
