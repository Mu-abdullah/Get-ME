import 'package:hive/hive.dart';

import '../../app/visited_places/model/visited_places.dart';

class HiveBoxName {
  static const visitedPlaces = 'visitedPlaces';
}

class Boxes {
  static var visitedPlaces = Hive.box<VisitedPlaces>(HiveBoxName.visitedPlaces);
}
