import 'package:hive/hive.dart';

part 'visited_places.g.dart';

@HiveType(typeId: 10)
class VisitedPlaces extends HiveObject {
  @HiveField(1)
  String name;
  @HiveField(2)
  String governorateNameAr;
  VisitedPlaces({
    required this.name,
    required this.governorateNameAr,
  });

  factory VisitedPlaces.fromJson(Map<String, dynamic> json) {
    return VisitedPlaces(
        name: json['name'], governorateNameAr: json['governorate_name_ar']);
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'governorate_name_ar': governorateNameAr};
}
