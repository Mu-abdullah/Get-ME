import 'package:dartz/dartz.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/data_services.dart';
import '../model/governorates_model.dart';

class GetHomeGovernoratesRepo {
  final DataService dataService;
  GetHomeGovernoratesRepo(this.dataService);
  Future<Either<CustomError, List<GovernoratesModel>>> getGovernorates() async {
    return dataService.getListOfData<GovernoratesModel>(
      BackendPoint.governorates,
      limit: 5,
      (e) => GovernoratesModel.fromJson(e),
    );
  }
}
