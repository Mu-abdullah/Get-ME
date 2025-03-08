import 'package:dartz/dartz.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/backend_points.dart';
import '../../../../core/services/supabase/data_services.dart';
import '../model/place_images_model.dart';

class AddImages {
  final DataService dataService;

  AddImages(this.dataService);

  Future<Either<CustomError, void>> addImages({
    required Map<String, dynamic> date,
  }) async {
    try {
      final result = await dataService.addData<PlaceImagesModel>(
        table: BackendPoint.placeImages,
        fromJson: PlaceImagesModel.fromJson,
        data: date,
      );

      return result.fold(
        (error) => Left(error),
        (_) => Right(null),
      );
    } catch (e) {
      return Left(CustomError('Failed to add item: $e'));
    }
  }
}
