import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/bottom_item.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(HomeInitial());

  static BottomBarCubit get(context) => BlocProvider.of(context);
  var currentIndex = 0;

  var items = BottomItem.items;
  var screens = BottomItem.screenItems;
  var title = BottomItem.titles;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }
}
