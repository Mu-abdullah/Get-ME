import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_city_state.dart';

class GetCityCubit extends Cubit<GetCityState> {
  GetCityCubit() : super(GetCityInitial());
}
