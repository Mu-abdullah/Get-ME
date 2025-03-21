import 'package:dartz/dartz.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/data_services.dart';
import '../model/governorates_model.dart';

class GetCitiesRepo {
  final DataService dataService;
  GetCitiesRepo(this.dataService);
  Future<Either<CustomError, List<GovernoratesModel>>> getCities() async {
    return dataService.getListOfData<GovernoratesModel>(
      BackendPoint.governorates,
      (e) => GovernoratesModel.fromJson(e),
    );
  }
}
