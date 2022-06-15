import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/application/pages/home/home_page.dart';
import 'package:erevho/application/pages/splashscreen/splash_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

/// TODO Implémenter le reste (params etc, là j'ai la flemme).
class AppRouter {
  final _router = FluroRouter();

  AppRouter() {
    _router.define(
      splash,
      handler: Handler(handlerFunc: (context, params) => const SplashPage()),
    );
    _router.define(
      home,
      handler: Handler(handlerFunc: (context, params) => const HomePage()),
    );
  }

  void navigate(BuildContext context, String path) {
    _router.navigateTo(context, path);
  }
}
