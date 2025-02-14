import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../features/home_screen/data/repo/get_cities_repo.dart';
import '../../../features/policy/data/repo/policy_repo.dart';
import '../ai/ai_setup.dart';
import '../supabase/data_services.dart';
import '../supabase/supabase_services.dart';
import '../supabase/supabase_services_repo.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  _registerRepositories();
  _registerServices();
  _registerAiSetup();
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

void _registerAiSetup() {
  // Register GenerativeModel as a singleton
  locator.registerLazySingleton<GenerativeModel>(
    () => GenerativeModel(
      apiKey: AiSetup.apiKey,
      model: 'gemini-2.0-flash-exp',
      generationConfig: GenerationConfig(),
    ),
  );
}
