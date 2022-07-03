import 'package:erevho/di/tools/app_localisation_tools.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:erevho/application/navigation/app_router.dart';
import 'package:erevho/application/pages/splashscreen/splash_page.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/core/themes/default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'dart:io';

class MyApp extends StatelessWidget {
  // Create object that manage routing throught our app.
  final AppRouter appRouter = AppRouter();
  final AppLocalisationTools appLocals = GetIt.instance();

  MyApp({Key? key}) : super(key: key) {
    // And then make it an singleton that we can use from anywhere.
    GetIt.instance.registerSingleton(appRouter);
    appLocals.setLocale(const Locale('fr', 'FR'));
  }

  @override
  Widget build(BuildContext context) {
    // Update bottom bar navigation.
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: nightGreyDarker,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    }

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: 'EREVHO',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: defaultTheme,
      darkTheme: defaultTheme,
      themeMode: ThemeMode.system,
      checkerboardOffscreenLayers: true,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
