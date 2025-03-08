import 'package:bloc/bloc.dart';

part 'get_city_state.dart';

class GetCityCubit extends Cubit<GetCityState> {
  GetCityCubit() : super(GetCityInitial());
}
