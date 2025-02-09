import 'package:flutter/material.dart';

import '../../core/routes/routes.dart';
import '../../core/routes/routes_name.dart';
import '../../core/language/app_localizations_setup.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: onGenerateRoute,
      initialRoute: RoutesNames.bloggerScreen,
    );
  }
}
