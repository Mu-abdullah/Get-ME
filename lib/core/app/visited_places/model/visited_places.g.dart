// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visited_places.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitedPlacesAdapter extends TypeAdapter<VisitedPlaces> {
  @override
  final int typeId = 10;

  @override
  VisitedPlaces read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitedPlaces(
      name: fields[1] as String,
      governorateNameAr: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VisitedPlaces obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.governorateNameAr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitedPlacesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
