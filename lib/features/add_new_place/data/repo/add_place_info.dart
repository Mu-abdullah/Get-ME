import 'package:dartz/dartz.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/data_services.dart';
import '../model/new_place_model.dart';

class AddPlaceInfo {
  final DataService dataService;

  AddPlaceInfo(this.dataService);

  Future<Either<CustomError, NewPlaceModel>> addItem({
    required Map<String, dynamic> date,
  }) async {
    try {
      final result = await dataService.addData<NewPlaceModel>(
        table: BackendPoint.places,
        fromJson: NewPlaceModel.fromJson,
        data: date,
      );

      return result.fold(
        (error) => Left(error),
        (serverResponse) => Right(serverResponse),
      );
    } catch (e) {
      return Left(CustomError('Failed to add item: $e'));
    }
  }
}
