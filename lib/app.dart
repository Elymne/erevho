import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/features/main/application/pages/splashscreen/splash_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/core/themes/default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apl = ref.read(appLocalisationToolsProvider);
    // Définir un moyen pour attribuer la langue utilisé sur l'app. (la flemme mais c'est rapide).
    apl.setLocale(const Locale('fr', 'FR'));

    // Update bottom bar navigation when on android device. Don't know why but the bottom navigation bar stay bright without this.
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: erevohDark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    }

    // This app is only usable on portrait mode.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: apl.current.appName,
      debugShowCheckedModeBanner: true,
      home: const SplashPage(),
      theme: defaultTheme,
      themeMode: ThemeMode.system,
      checkerboardOffscreenLayers: true,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
