import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home_screen/data/model/governorates_model.dart';
import '../../../data/repo/governorates_repo.dart';

part 'governorates_state.dart';

class GovernoratesCubit extends Cubit<GovernoratesState> {
  GetGovernoratesRepo repo;
  GovernoratesCubit(
    this.repo, {
    required this.isAddedPlace,
  }) : super(GovernoratesInitial());
  static GovernoratesCubit get(context) => BlocProvider.of(context);

  final bool isAddedPlace;

  Future<void> getGovernorates() async {
    emit(LoadingGovernorates());
    final result = await repo.getGovernorates();
    result.fold((l) {
      if (!isClosed) {
        emit(ErrorGetGovernorates(l.message));
      }
    }, (r) {
      if (!isClosed) {
        emit(GovernoratesLoaded(r));
      }
    });
  }
}
