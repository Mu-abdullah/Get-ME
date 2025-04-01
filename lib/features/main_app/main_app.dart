import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app/language/language_cubit/language_cubit.dart';
import '../../core/routes/routes.dart';
import '../../core/routes/routes_name.dart';
import '../../core/language/app_localizations_setup.dart';
import '../../core/style/color/color_light.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  static void updateAppLocale(BuildContext context, Locale locale) {
    final state = context.findAncestorStateOfType<_MainAppState>();
    state?.setLocale(locale);
  }

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, String>(
        builder: (context, language) {
          return MaterialApp(
            scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
            debugShowCheckedModeBanner: false,
            locale: _locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: ColorsLight.scaffoldBackground,
            ),
            onGenerateRoute: onGenerateRoute,
            initialRoute: RoutesNames.homeScreen,
          );
        },
      ),
    );
  }
}
