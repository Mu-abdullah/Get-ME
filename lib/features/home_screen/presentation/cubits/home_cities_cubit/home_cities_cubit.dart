import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/home_get_cities_model.dart';
import '../../../data/repo/get_home_city_repo.dart';

part 'home_cities_state.dart';

class HomeCitiesCubit extends Cubit<HomeCitiesState> {
  GetHomeCityRepo repo;
  HomeCitiesCubit(this.repo) : super(HomeCitiesInitial()) {
    getCities();
  }

  static HomeCitiesCubit get(context) => BlocProvider.of(context);

  Future<void> getCities() async {
    emit(LoadingCity());
    final result = await repo.getCity();
    result.fold((l) {
      if (!isClosed) {
        emit(ErrorGetCity(l.message));
      }
    }, (r) {
      if (!isClosed) {
        r.shuffle();
        emit(CityLoaded(r));
      }
    });
  }
}
