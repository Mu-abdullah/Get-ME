import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../home_screen/data/model/get_place_image_model.dart';
import '../../../../home_screen/data/model/places_model.dart';

class UserPlaceInfo extends StatelessWidget {
  const UserPlaceInfo({
    super.key,
    required this.item,
    required this.images,
  });

  final PlacesModel item;
  final List<GetPlaceImageModel> images;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      bottom: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              item.name!,
              color: AppColors.black,
              fontSize: context.bodyMedium!.fontSize,
              isBold: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              item.description!,
              color: AppColors.black,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              item.location!,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(RoutesNames.imagePreview, arguments: {
                        'imagesList': images
                            .map((e) => e.url)
                            .whereType<String>()
                            .toList(),
                        'title': item.name
                      });
                    },
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            images[index].url!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: images.length,
            ),
          ),
        ],
      ),
    );
  }
}
