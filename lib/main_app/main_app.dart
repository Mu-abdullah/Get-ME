import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/services/shared_pref/pref_keys.dart';
import 'package:getme/core/services/shared_pref/shared_pref.dart';

import '../core/app/language/language_cubit/language_cubit.dart';
import '../core/app/no_internet/connection_controller/connection_controller.dart';
import '../core/app/no_internet/no_internet_screen.dart';
import '../core/routes/routes.dart';
import '../core/routes/routes_name.dart';
import '../core/language/app_localizations_setup.dart';
import '../core/style/color/app_color.dart';

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
  Locale _locale = const Locale('ar');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectionController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => LanguageCubit(),
              ),
            ],
            child: BlocBuilder<LanguageCubit, String>(
              builder: (context, language) {
                // Update _locale when language changes, but only if different
                if (_locale.languageCode != language) {
                  _locale = Locale(language);
                }
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
                    scaffoldBackgroundColor: AppColors.scaffoldBackground,
                  ),
                  builder: (context, child) {
                    return GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Scaffold(
                        body: Builder(
                          builder: (context) {
                            ConnectionController.instance.init();
                            return child!;
                          },
                        ),
                      ),
                    );
                  },
                  onGenerateRoute: onGenerateRoute,
                  initialRoute: getInitialRoute(),
                );
              },
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: _locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            home: NoInternetScreen(),
          );
        }
      },
    );
  }

  String getInitialRoute() {
    final isConnected = ConnectionController.instance.isConnected.value;
    final onBoarding = SharedPref.getData(key: PrefKeys.onBoarding);

    if (isConnected) {
      if (onBoarding != true) {
        return RoutesNames.onBoarding;
      } else {
        return RoutesNames.homeScreen;
      }
    } else {
      return RoutesNames.noInternet;
    }
  }
}
