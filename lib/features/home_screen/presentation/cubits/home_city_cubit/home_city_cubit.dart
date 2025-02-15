import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/city_model.dart';
import '../../../data/repo/get_home_cities_repo.dart';

part 'home_city_state.dart';

class HomeCityCubit extends Cubit<HomeCityState> {
  GetHomeCitiesRepo repo;
  HomeCityCubit(this.repo) : super(HomeInitial()) {
    getCities();
  }
  static HomeCityCubit get(context) => BlocProvider.of(context);

  Future<void> getCities() async {
    emit(LoadingCities());
    final result = await repo.getCities();
    result.fold((l) {
      if (!isClosed) {
        emit(ErrorGetCities(l.message));
      }
    }, (r) {
      if (!isClosed) {
        r.shuffle();
        emit(CitiesLoaded(r));
      }
    });
  }
}
