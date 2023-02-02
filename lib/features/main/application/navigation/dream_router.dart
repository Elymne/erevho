import 'package:erevho/features/main/application/navigation/routes.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_page.dart';
import 'package:erevho/features/main/application/pages/home/home_page.dart';
import 'package:erevho/features/main/application/pages/personnal/personnal_page.dart';
import 'package:erevho/features/main/application/pages/splashscreen/splash_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dreamRouterProvider = Provider((ref) => DreamRouter());

class DreamRouter {
  void definesRoutes(FluroRouter router) {
    router.define(
      splash,
      handler: Handler(handlerFunc: (context, params) => const SplashPage()),
      transitionType: TransitionType.none,
    );
    router.define(
      home,
      handler: Handler(handlerFunc: (context, params) => const HomePage()),
      transitionType: TransitionType.none,
    );
    router.define(
      personnal,
      handler: Handler(handlerFunc: (context, params) => const PersonnalPage()),
      transitionType: TransitionType.none,
    );
    router.define(
      dreamFormCreate,
      handler: Handler(handlerFunc: (context, params) => const DreamFormPage(dreamId: null)),
      transitionType: TransitionType.inFromBottom,
    );
    router.define(
      dreamFormCreate,
      handler: Handler(handlerFunc: (context, params) => const DreamFormPage(dreamId: null)),
      transitionType: TransitionType.inFromBottom,
    );
    router.define(
      dreamFormUpdate,
      handler: Handler(handlerFunc: (context, params) => DreamFormPage(dreamId: params['id']?[0])),
      transitionType: TransitionType.inFromBottom,
    );
  }
}
