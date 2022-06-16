import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/application/pages/home/home_page.dart';
import 'package:erevho/application/pages/personnal/personnal_page.dart';
import 'package:erevho/application/pages/splashscreen/splash_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

/// AppRouter class.
/// Injected from app class as singleton.
class AppRouter {
  final _router = FluroRouter();

  AppRouter() {
    _router.define(
      splash,
      handler: Handler(handlerFunc: (context, params) => const SplashPage()),
      transitionType: TransitionType.none,
    );
    _router.define(
      home,
      handler: Handler(handlerFunc: (context, params) => const HomePage()),
      transitionType: TransitionType.none,
    );
    _router.define(
      personnal,
      handler: Handler(handlerFunc: (context, params) => PersonnalPage()),
      transitionType: TransitionType.none,
    );
  }

  void navigate(BuildContext context, String path) {
    _router.navigateTo(context, path);
  }
}
