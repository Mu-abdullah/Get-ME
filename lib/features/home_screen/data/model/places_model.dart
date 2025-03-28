import 'package:getme/core/entities/place_entity.dart';

class PlacesModel extends PlaceEntity {
  PlacesModel({
    required super.id,
    required super.name,
    required super.description,
    required super.location,
    required super.governoratesId,
    required super.createdAt,
    required super.placeId,
    required super.status,
    required super.governorateNameAr,
  });

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        location: json['location'],
        governoratesId: json['governorates_id'],
        createdAt: json['created_at'],
        placeId: json['place_id'],
        status: json['status'],
        governorateNameAr: json['governorate_name_ar'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'location': location,
        'governorates_id': governoratesId,
        'created_at': createdAt,
        'place_id': placeId,
        'status': status,
        'governorate_name_ar': governorateNameAr,
      };
}
