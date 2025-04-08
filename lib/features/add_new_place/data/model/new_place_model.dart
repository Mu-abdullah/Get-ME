import '../../../../core/entities/place_entity.dart';

class NewPlaceModel extends PlaceEntity {
  NewPlaceModel({
    required super.name,
    required super.description,
    required super.governoratesId,
    required super.location,
    required super.governorateNameAr,
    super.placeId,
    super.status,
    super.userId,
  });

  factory NewPlaceModel.fromJson(Map<String, dynamic> json) {
    return NewPlaceModel(
      name: json['name'],
      description: json['description'],
      governoratesId: json['governorates_id'],
      governorateNameAr: json['governorate_name_ar'],
      location: json['location'],
      placeId: json['place_id'],
      status: json['status'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'governorates_id': governoratesId,
      'governorate_name_ar': governorateNameAr,
      'location': location,
      'place_id': placeId,
      'status': status,
      'user_id': userId,
    };
  }
}
