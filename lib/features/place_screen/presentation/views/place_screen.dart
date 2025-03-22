import 'package:flutter/material.dart';

import '../../../home_screen/data/model/get_place_image_model.dart';
import '../../../home_screen/data/model/places_model.dart';
import '../refactor/place_screen_body.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key, required this.images, required this.place});

  final List<GetPlaceImageModel> images;
  final PlacesModel place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceScreenBody(
        place: place,
        images: images,
      ),
    );
  }
}
