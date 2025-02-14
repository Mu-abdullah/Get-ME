import '../../../../core/entities/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({
    required super.id,
    required super.createdAt,
    required super.name,
    required super.nameAr,
    required super.image,
    required super.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json['id'],
        createdAt: json['created_at'],
        name: json['name'],
        nameAr: json['name_ar'],
        image: json['image'],
        country: json['country'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt,
        'name': name,
        'name_ar': nameAr,
        'image': image,
        'country': country,
      };
}
