class PlaceEntity {
  final int? id;
  final String? createdAt;
  final String? name;
  final String? location;
  final String? description;
  final int? governoratesId;
  final String governorateNameAr;
  final String? placeId;
  final String? status;

  PlaceEntity({
    this.id,
    this.createdAt,
    this.name,
    this.location,
    this.description,
    this.governoratesId,
    this.placeId,
    this.status,
    required this.governorateNameAr,
  });
}
