import '../../../../core/entities/images_entity.dart';

class PlaceImagesModel extends ImagesEntity {
  PlaceImagesModel({
    required super.url,
    required super.placeId,
  });

  factory PlaceImagesModel.fromJson(Map<String, dynamic> json) {
    return PlaceImagesModel(
      url: json['url'],
      placeId: json['place_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'place_id': placeId,
    };
  }
}
