import 'package:erevho/application/navigation/routes.dart';
import 'package:erevho/application/pages/dream_form/dream_form_page.dart';
import 'package:erevho/application/pages/home/home_page.dart';
import 'package:erevho/application/pages/personnal/personnal_page.dart';
import 'package:erevho/application/pages/splashscreen/splash_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouterProvider = Provider((_) => AppRouter());

/// AppRouter class.
/// Define each route + their arguments and params.
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
      handler: Handler(handlerFunc: (context, params) => const PersonnalPage()),
      transitionType: TransitionType.none,
    );
    _router.define(
      dreamFormCreate,
      handler: Handler(handlerFunc: (context, params) => const DreamFormPage(dreamId: null)),
      transitionType: TransitionType.inFromBottom,
    );
    _router.define(
      dreamFormCreate,
      handler: Handler(handlerFunc: (context, params) => const DreamFormPage(dreamId: null)),
      transitionType: TransitionType.inFromBottom,
    );
    _router.define(
      dreamFormUpdate,
      handler: Handler(handlerFunc: (context, params) => DreamFormPage(dreamId: params['id']?[0])),
      transitionType: TransitionType.inFromBottom,
    );
  }

  void navigate(BuildContext context, String path) {
    _router.navigateTo(context, path);
  }
}
