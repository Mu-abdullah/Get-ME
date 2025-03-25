import 'package:dartz/dartz.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/data_services.dart';
import '../model/governorates_model.dart';

class GetGovernoratesRepo {
  final DataService dataService;
  GetGovernoratesRepo(this.dataService);
  Future<Either<CustomError, List<GovernoratesModel>>> getGovernorates() async {
    return dataService.getListOfData<GovernoratesModel>(
      BackendPoint.governorates,
      (e) => GovernoratesModel.fromJson(e),
    );
  }
}
