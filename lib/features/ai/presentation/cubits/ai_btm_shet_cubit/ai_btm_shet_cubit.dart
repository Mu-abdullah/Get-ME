import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'ai_btm_shet_state.dart';

class AiBtmShetCubit extends Cubit<AiBtmShetState> {
  AiBtmShetCubit(context) : super(AiBtmShetInitial());

  static AiBtmShetCubit get(context) => BlocProvider.of(context);

  bool showAgain = false;

  void toggleButton() {
    showAgain = !showAgain;
    emit(ToggleButton());
  }

  // saved value to shared preferences
  void saveShowAgainValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('showAgain', showAgain);
  }
}
