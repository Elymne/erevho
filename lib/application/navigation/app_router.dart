import 'package:erevho/application/pages/home/home_page.dart';
import 'package:erevho/application/pages/splashscreen/splash_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AppRouter {
  final _router = FluroRouter();

  AppRouter() {
    _defineRoutes();
  }

  void navigate(BuildContext context, String path) {
    _router.navigateTo(context, path);
  }

  void _defineRoutes() {
    _router.define(
      '/splash',
      handler: Handler(handlerFunc: (context, params) => const SplashPage()),
    );
    _router.define(
      '/home',
      handler: Handler(handlerFunc: (context, params) => const HomePage()),
    );
  }
}
