import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/features/policy/data/model/plicy_model.dart';

import '../../../data/repo/policy_repo.dart';

part 'policy_state.dart';

class PolicyCubit extends Cubit<PolicyState> {
  PolicyRepo repo;
  PolicyCubit(this.repo) : super(PolicyInitial());

  static PolicyCubit get(context) => BlocProvider.of(context);

  Future<void> getPolicy() async {
    emit(PolicyLoading());
    final result = await repo.getCities();
    result.fold((l) {
      if (!isClosed) {
        emit(PolicyError(l.message));
      }
    }, (r) {
      if (!isClosed) {
        r.sort((a, b) => a.id.compareTo(b.id));
        emit(PolicyLoaded(r));
      }
    });
  }
}
