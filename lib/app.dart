import 'package:erevho/application/navigation/app_router.dart';
import 'package:erevho/application/pages/splashscreen/splashscreen_page.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'EREVHO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashscreenPage(),
    );
  }
}
