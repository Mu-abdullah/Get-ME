import 'package:dartz/dartz.dart';

import '../../../error/custom_errors.dart';
import '../../../language/lang_keys.dart';
import '../../../services/hive/hive_boxes.dart';
import '../model/visited_places.dart';

class GetVisitedPlaces {
  final box = Boxes.visitedPlaces;

  Future<Either<CustomError, List<VisitedPlaces>>> fetchAllPlaces() async {
    final result = box.values.toList();
    return result.isEmpty
        ? Left(CustomError(LangKeys.noDataFound))
        : Right(result);
  }
}
