import 'package:flutter/material.dart';

import '../../core/routes/routes.dart';
import '../../core/routes/routes_name.dart';
import '../../core/language/app_localizations_setup.dart';
import '../../core/style/color/color_light.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ColorsLight.scaffoldBackground,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: RoutesNames.homeScreen,
    );
  }
}
