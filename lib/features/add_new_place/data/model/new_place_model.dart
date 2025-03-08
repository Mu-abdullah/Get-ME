import '../../../../core/entities/place_entity.dart';

class NewPlaceModel extends PlaceEntity {
  NewPlaceModel({
    required super.name,
    required super.description,
    required super.cityId,
    required super.location,
    super.placeId,
  });

  factory NewPlaceModel.fromJson(Map<String, dynamic> json) {
    return NewPlaceModel(
      name: json['name'],
      description: json['description'],
      cityId: json['city_id'],
      location: json['location'],
      placeId: json['place_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'city_id': cityId,
      'location': location,
      'place_id': placeId,
    };
  }
}
