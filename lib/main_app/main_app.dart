import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app/language/language_cubit/language_cubit.dart';
import '../core/app/no_internet/connection_controller/connection_controller.dart';
import '../core/app/no_internet/no_internet_screen.dart';
import '../core/routes/routes.dart';
import '../core/routes/routes_name.dart';
import '../core/language/app_localizations_setup.dart';
import '../core/services/shared_pref/pref_keys.dart';
import '../core/services/shared_pref/shared_pref.dart';
import '../core/style/color/app_color.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static void updateAppLocale(BuildContext context, Locale locale) {
    final state = context.findAncestorStateOfType<_MainAppState>();
    state?._updateLocale(locale);
  }

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale = const Locale('ar');

  void _updateLocale(Locale locale) {
    if (_locale != locale && mounted) {
      setState(() {
        _locale = locale;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectionController.instance.isConnected,
      builder: (_, isConnected, __) =>
          isConnected ? _buildConnectedApp() : _buildDisconnectedApp(),
    );
  }

  Widget _buildConnectedApp() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: BlocBuilder<LanguageCubit, String>(
        builder: (context, language) {
          _syncLocaleWithLanguage(language);
          return _buildMaterialApp(
            initialRoute: _getConnectedInitialRoute(),
            builder: _appBuilder,
          );
        },
      ),
    );
  }

  Widget _buildDisconnectedApp() {
    return _buildMaterialApp(
      home: const NoInternetScreen(),
    );
  }

  MaterialApp _buildMaterialApp({
    Widget? home,
    String? initialRoute,
    Widget Function(BuildContext, Widget?)? builder,
  }) {
    return MaterialApp(
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
      theme: _appTheme,
      builder: builder ?? (_, child) => child!,
      onGenerateRoute: onGenerateRoute,
      initialRoute: initialRoute,
      home: home,
    );
  }

  Widget _appBuilder(BuildContext context, Widget? child) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            ConnectionController.instance.init();
            return child!;
          },
        ),
      ),
    );
  }

  void _syncLocaleWithLanguage(String language) {
    final newLocale = Locale(language);
    if (_locale.languageCode != language) {
      _locale = newLocale;
    }
  }

  String _getConnectedInitialRoute() {
    final hasSeenOnboarding =
        SharedPref.getData(key: PrefKeys.onBoarding) == true;
    return hasSeenOnboarding ? RoutesNames.homeScreen : RoutesNames.onBoarding;
  }

  ThemeData get _appTheme => ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      );
}
