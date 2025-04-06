import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/app/visited_places/model/visited_places.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../services/hive/hive_boxes.dart';
import '../repo/get_visited_places.dart';
part 'visited_placed_state.dart';

class VisitedPlacedCubit extends Cubit<VisitedPlacedState> {
  GetVisitedPlaces repo = GetVisitedPlaces();
  VisitedPlacedCubit() : super(VisitedPlacedInitial()) {
    fetchAllPlaces();
  }

  final placesBox = Hive.box<VisitedPlaces>(HiveBoxName.visitedPlaces);
  List<VisitedPlaces> places = [];

  Future<void> fetchAllPlaces() async {
    emit(PlacesLoading());
    final result = await repo.fetchAllPlaces();

    result.fold(
      (error) {
        if (!isClosed) emit(PlacesError(message: error.message));
      },
      (fetchedOrders) {
        places = fetchedOrders;
        emit(PlacesLoaded(places: fetchedOrders));
      },
    );
  }

  Future<void> addPlaceToBox(VisitedPlaces value) async {
    await placesBox.add(value);
  }
}
