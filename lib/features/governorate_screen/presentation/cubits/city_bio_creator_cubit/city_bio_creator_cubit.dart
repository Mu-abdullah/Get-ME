import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/city_bio_creator.dart';

part 'city_bio_creator_state.dart';

class CityBioCreatorCubit extends Cubit<CityBioCreatorState> {
  CityBioCreatorCubit() : super(CityBioCreatorInitial());
  CityBioCreator cityBioCreator = CityBioCreator();
  static CityBioCreatorCubit get(context) => BlocProvider.of(context);

  Future<void> generateCityBio(
      {required String city, required String lang}) async {
    emit(LoadingCityBio());
    try {
      String bio = await cityBioCreator.generateCityBio(
        city: city,
        lang: lang,
      );
      if (!isClosed) {
        emit(CityBioGenerated(bio));
      }
    } catch (e) {
      if (!isClosed) {
        emit(CityBioError(e.toString()));
      }
    }
  }
}
