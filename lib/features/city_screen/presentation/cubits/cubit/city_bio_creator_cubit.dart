import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/city_bio_creator.dart';

part 'city_bio_creator_state.dart';

class CityBioCreatorCubit extends Cubit<CityBioCreatorState> {
  CityBioCreatorCubit() : super(CityBioCreatorInitial());
  CityBioCreator cityBioCreator = CityBioCreator();
  static CityBioCreatorCubit get(context) => BlocProvider.of(context);

  Future<void> generateCityBio(String city) async {
    emit(LoadingCityBio());
    try {
      String bio = await cityBioCreator.generateCityBio(city);
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
