import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app/env_variable.dart';
import 'core/app/no_internet/connection_controller/connection_controller.dart';
import 'core/app/visited_places/model/visited_places.dart';
import 'core/routes/bloc_observer.dart';
import 'core/services/get_it/git_it.dart';
import 'core/services/hive/hive_boxes.dart';
import 'core/services/shared_pref/shared_pref.dart';
import 'core/services/supabase/supabase_init.dart';
import 'main_app/main_app.dart';

Future<void> main() async {
  await EnvVariable.instance.init(envType: EnvTypeEnum.prod);
  await ConnectionController.instance.init();
  await SupabaseInit().initSupabase();
  await SharedPref.init();
  await _initializeHive();
  Bloc.observer = AppBlocObserver();
  setupLocator();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MainApp());
  });
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(VisitedPlacesAdapter());
  await Hive.openBox<VisitedPlaces>(HiveBoxName.visitedPlaces);
}
