import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/governorates_model.dart';
import '../../../data/repo/get_home_governorates_repo.dart';

part 'home_governorates_state.dart';

class HomeGovernoratesCubit extends Cubit<HomeGovernoratesState> {
  GetHomeGovernoratesRepo repo;
  HomeGovernoratesCubit(this.repo) : super(HomeInitial()) {
    getGovernorates();
  }
  static HomeGovernoratesCubit get(context) => BlocProvider.of(context);

  Future<void> getGovernorates() async {
    emit(LoadingGovernorates());
    final result = await repo.getGovernorates();
    result.fold((l) {
      if (!isClosed) {
        emit(ErrorGetGovernorates(l.message));
      }
    }, (r) {
      if (!isClosed) {
        // r.shuffle();
        r.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        emit(GovernoratesLoaded(r));
      }
    });
  }
}
