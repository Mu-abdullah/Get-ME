import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/governorates_model.dart';
import '../../../data/repo/cities_repo.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  GetCitiesRepo repo;
  CitiesCubit(this.repo) : super(CitiesInitial());
  static CitiesCubit get(context) => BlocProvider.of(context);

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
