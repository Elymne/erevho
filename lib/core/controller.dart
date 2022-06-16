import 'package:erevho/core/params.dart';
import 'package:flutter/material.dart';

abstract class Controller {
  late final BuildContext context;

  void init(BuildContext context) async {
    this.context = context;
  }
}

abstract class ControllerWithParams<P extends Params> {
  late final BuildContext context;

  void init(BuildContext context, P params) async {
    this.context = context;
  }
}
