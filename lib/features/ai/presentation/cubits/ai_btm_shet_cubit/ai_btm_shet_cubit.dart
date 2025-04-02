import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../../core/services/shared_pref/shared_pref.dart';

part 'ai_btm_shet_state.dart';

class AiBtmShetCubit extends Cubit<AiBtmShetState> {
  AiBtmShetCubit(context) : super(AiBtmShetInitial());

  static AiBtmShetCubit get(context) => BlocProvider.of(context);

  bool showAgain = false;

  void toggleButton() {
    showAgain = !showAgain;
    emit(ToggleButton());
  }

  void saveShowAgainValue() async {
    SharedPref.saveData(key: PrefKeys.showAiIntroduction, value: showAgain);
    debugPrint('showAgain: $showAgain');
    emit(ShowAgainState(showAgain));
  }
}
