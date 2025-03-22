import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/governorates_model.dart';
import '../../../data/repo/get_home_cities_repo.dart';

part 'home_governorates_state.dart';

class HomeGovernoratesCubit extends Cubit<HomeGovernoratesState> {
  GetHomeCitiesRepo repo;
  HomeGovernoratesCubit(this.repo) : super(HomeInitial()) {
    getCities();
  }
  static HomeGovernoratesCubit get(context) => BlocProvider.of(context);

  Future<void> getCities() async {
    emit(LoadingGovernorates());
    final result = await repo.getCities();
    result.fold((l) {
      if (!isClosed) {
        emit(ErrorGetGovernorates(l.message));
      }
    }, (r) {
      if (!isClosed) {
        r.shuffle();
        emit(GovernoratesLoaded(r));
      }
    });
  }
}
