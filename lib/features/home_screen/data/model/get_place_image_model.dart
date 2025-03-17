import '../../../../core/entities/images_entity.dart';

class GetPlaceImageModel extends ImagesEntity {
  GetPlaceImageModel({
    required super.id,
    required super.createdAt,
    required super.url,
    required super.placeId,
  });

  factory GetPlaceImageModel.fromJson(Map<String, dynamic> json) {
    return GetPlaceImageModel(
      url: json['url'],
      placeId: json['place_id'],
      id: json['id'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'place_id': placeId,
      'id': id,
      'created_at': createdAt,
    };
  }
}
