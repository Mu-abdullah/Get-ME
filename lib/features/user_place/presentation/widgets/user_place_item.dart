import 'package:flutter/material.dart';

import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../home_screen/data/model/get_place_image_model.dart';
import '../../../home_screen/data/model/places_model.dart';
import 'user_place_card/place_status_badge.dart';
import 'user_place_card/user_place_info.dart';

class UserPlaceItem extends StatelessWidget {
  const UserPlaceItem({
    super.key,
    required this.item,
    required this.images,
  });

  final PlacesModel item;

  final List<GetPlaceImageModel> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.mediumRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
            ]),
        child: Stack(
          children: [
            PlaceStatusBadge(item: item),
            UserPlaceInfo(item: item, images: images)
          ],
        ),
      ),
    );
  }
}
