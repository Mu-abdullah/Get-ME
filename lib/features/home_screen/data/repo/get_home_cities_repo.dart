import 'package:dartz/dartz.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/data_services.dart';
import '../model/governorates_model.dart';

class GetHomeCitiesRepo {
  final DataService dataService;
  GetHomeCitiesRepo(this.dataService);
  Future<Either<CustomError, List<GovernoratesModel>>> getCities() async {
    return dataService.getListOfData<GovernoratesModel>(
      BackendPoint.governorates,
      limit: 5,
      (e) => GovernoratesModel.fromJson(e),
    );
  }
}
