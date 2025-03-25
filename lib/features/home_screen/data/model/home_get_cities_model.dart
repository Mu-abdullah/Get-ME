import '../../../../core/entities/cities_entity.dart';

class HomeGetCitiesModel extends CitiesEntity {
  HomeGetCitiesModel({
    required super.id,
    required super.createdAt,
    required super.cityName,
    required super.cityNameAr,
    required super.governorates,
    required super.governoratesAr,
  });

  factory HomeGetCitiesModel.fromJson(Map<String, dynamic> json) {
    return HomeGetCitiesModel(
      id: json['id'],
      createdAt: json['created_at'],
      cityName: json['city_name'],
      cityNameAr: json['city_name_ar'],
      governorates: json['governorates'],
      governoratesAr: json['governorates_ar'],
    );
  }
}
