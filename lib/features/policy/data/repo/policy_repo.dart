import 'package:dartz/dartz.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/data_services.dart';
import '../../../../features/policy/data/model/plicy_model.dart';

import '../../../../core/services/supabase/backend_points.dart';

class PolicyRepo {
  final DataService dataService;
  PolicyRepo(this.dataService);
  Future<Either<CustomError, List<PolicyModel>>> getCities() async {
    return dataService.getListOfData<PolicyModel>(
      BackendPoint.policy,
      limit: 10,
      (e) => PolicyModel.fromJson(e),
    );
  }
}
