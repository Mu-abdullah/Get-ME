import 'package:dartz/dartz.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/data_services.dart';
import '../model/city_model.dart';

class GetHomeCitiesRepo {
  final DataService dataService;
  GetHomeCitiesRepo(this.dataService);
  Future<Either<CustomError, List<CityModel>>> getCities() async {
    return dataService.getListOfData<CityModel>(
      BackendPoint.cities,
      limit: 5,
      (e) => CityModel.fromJson(e),
    );
  }
}
