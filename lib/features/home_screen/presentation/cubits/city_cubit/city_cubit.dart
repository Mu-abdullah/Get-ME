import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/city_model.dart';
import '../../../data/repo/get_cities_repo.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  GetCitiesRepo repo;
  CityCubit(this.repo) : super(HomeInitial()) {
    getCities();
  }
  static CityCubit get(context) => BlocProvider.of(context);

  Future<void> getCities() async {
    emit(LoadingCities());
    final result = await repo.getCities();
    result.fold((l) {
      if (!isClosed) {
        emit(ErrorGetCities(l.message));
      }
    }, (r) {
      if (!isClosed) {
        emit(CitiesLoaded(r));
      }
    });
  }
}
