import 'package:dartz/dartz.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/data_services.dart';
import '../model/home_get_cities_model.dart';

class GetHomeCityRepo {
  final DataService dataService;
  GetHomeCityRepo(this.dataService);

  Future<Either<CustomError, List<HomeGetCitiesModel>>> getCity() async {
    return dataService.getListOfData<HomeGetCitiesModel>(
      BackendPoint.cities,
      limit: 15,
      (e) => HomeGetCitiesModel.fromJson(e),
    );
  }
}
