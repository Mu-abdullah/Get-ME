import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  _registerRepositories();
  _registerServices();
}

void _registerRepositories() {
  //  locator.registerLazySingleton(() => JustForYouProductRepository(locator()));
}

void _registerServices() {
  // locator.registerLazySingleton(() => SupabaseServicesRepo());
  // locator
  //     .registerLazySingleton<DataService>(() => SupabaseDataService(locator()));
  // locator.registerLazySingleton(() => AuthServices());
}
