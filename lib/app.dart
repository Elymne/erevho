import 'dart:io';

import 'package:erevho/application/navigation/app_router.dart';
import 'package:erevho/application/pages/splashscreen/splash_page.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/core/themes/default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  // Create object that ùanage routing throught our app.
  final AppRouter appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key) {
    // And then make it an singleton that we can use from anywhere.
    GetIt.instance.registerSingleton(appRouter);
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: nightGreyDarker,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    }

    return MaterialApp(
      title: 'EREVHO',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: defaultTheme,
      darkTheme: defaultTheme,
      themeMode: ThemeMode.system,
    );
  }
}
