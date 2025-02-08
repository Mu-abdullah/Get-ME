import 'package:flutter/material.dart';
import 'package:getme/core/language/app_localizations_setup.dart';
import 'package:getme/features/home/presentation/views/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      locale: Locale('ar'),
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
