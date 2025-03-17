import 'package:getme/core/entities/place_entity.dart';

class PlacesModel extends PlaceEntity {
  PlacesModel({
    required super.id,
    required super.name,
    required super.description,
    required super.location,
    required super.cityId,
    required super.createdAt,
    required super.placeId,
    required super.status,
  });

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        location: json['location'],
        cityId: json['city_id'],
        createdAt: json['created_at'],
        placeId: json['place_id'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'location': location,
        'city_id': cityId,
        'created_at': createdAt,
        'place_id': placeId,
        'status': status,
      };
}
