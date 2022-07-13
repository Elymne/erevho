import 'package:erevho/application/navigation/app_router.dart';
import 'package:erevho/di/tools/app_localisation_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

abstract class Controller {
  /// Routing service.
  final AppRouter appRouter = GetIt.I();

  /// Translation service.
  final AppLocalisationTools alt = GetIt.I();

  /// Basics views attributes.
  late final BuildContext? context;
  late final WidgetRef? ref;

  /// Init context and provider ref.
  /// Should be called by Widget on init.
  void init({BuildContext? context, WidgetRef? ref}) {
    this.context = context;
    this.ref = ref;
  }

  void setBuildContext(BuildContext context) => this.context = context;

  void setBuildRef(WidgetRef ref) => this.ref = ref;
}
