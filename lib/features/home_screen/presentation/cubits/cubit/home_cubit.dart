import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/bottom_item.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  var currentIndex = 0;

  var items = BottomItem.items;
  var screens = BottomItem.screenItems;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }
}
