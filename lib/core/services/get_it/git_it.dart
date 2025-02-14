import 'package:get_it/get_it.dart';

import '../../../features/home_screen/data/repo/get_cities_repo.dart';
import '../../../features/policy/data/repo/policy_repo.dart';
import '../supabase/data_services.dart';
import '../supabase/supabase_services.dart';
import '../supabase/supabase_services_repo.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  _registerRepositories();
  _registerServices();
}

void _registerRepositories() {
  locator.registerLazySingleton(() => GetCitiesRepo(locator()));
  locator.registerLazySingleton(() => PolicyRepo(locator()));
}

void _registerServices() {
  locator.registerLazySingleton(() => SupabaseServicesRepo());
  locator
      .registerLazySingleton<DataService>(() => SupabaseDataService(locator()));
}
