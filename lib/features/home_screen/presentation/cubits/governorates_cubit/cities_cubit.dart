import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/governorates_model.dart';
import '../../../data/repo/governorates_repo.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  GetGovernoratesRepo repo;
  CitiesCubit(this.repo) : super(CitiesInitial());
  static CitiesCubit get(context) => BlocProvider.of(context);

  Future<void> getCities() async {
    emit(LoadingCities());
    final result = await repo.getGovernorates();
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
