part of 'city_bio_creator_cubit.dart';

abstract class CityBioCreatorState {}

class CityBioCreatorInitial extends CityBioCreatorState {}

class CityBioGenerated extends CityBioCreatorState {
  final String bio;
  CityBioGenerated(this.bio);
}

class CityBioError extends CityBioCreatorState {
  final String error;
  CityBioError(this.error);
}

class LoadingCityBio extends CityBioCreatorState {}
