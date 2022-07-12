import 'package:erevho/application/navigation/app_router.dart';
import 'package:erevho/di/tools/app_localisation_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

abstract class Controller {
  final AppRouter appRouter = GetIt.I();
  final AppLocalisationTools appLocals = GetIt.I();

  late final BuildContext? context;
  late final WidgetRef? ref;

  void init({BuildContext? context, WidgetRef? ref}) async {
    this.context = context;
    this.ref = ref;
  }

  void setBuildContext(BuildContext context) => this.context = context;

  void setBuildRef(WidgetRef ref) => this.ref = ref;
}
