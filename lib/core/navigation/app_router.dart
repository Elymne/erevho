import 'package:erevho/features/main/application/navigation/dream_router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouterProvider = Provider((ref) => AppRouter(ref.read(dreamRouterProvider)));

/// AppRouter class.
/// Define each route + their arguments and params.
class AppRouter {
  final DreamRouter _dreamRouter;
  final _router = FluroRouter();

  AppRouter(this._dreamRouter) {
    _dreamRouter.definesRoutes(_router);
  }

  void navigate(BuildContext context, String path) {
    _router.navigateTo(context, path);
  }
}
