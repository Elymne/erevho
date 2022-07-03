import 'package:erevho/core/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class StatelessController {
  late final BuildContext context;
  void init(BuildContext context) async {
    this.context = context;
  }
}

abstract class StatefulController {
  late final BuildContext context;
  late final WidgetRef ref;
  void init(BuildContext context, WidgetRef ref) async {
    this.context = context;
    this.ref = ref;
  }
}

abstract class StatelessControllerWithParams<P extends Params> {
  late final BuildContext context;
  late final P params;
  void init(BuildContext context, P params) async {
    this.context = context;
    this.params = params;
  }
}

abstract class StatefulControllerWithParams<P extends Params> {
  late final BuildContext context;
  late final WidgetRef ref;
  late final P? params;
  void init(BuildContext context, WidgetRef ref, P params) async {
    this.context = context;
    this.ref = ref;
    this.params = params;
  }
}
