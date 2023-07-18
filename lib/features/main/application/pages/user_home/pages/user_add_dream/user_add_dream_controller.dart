import 'package:erevho/core/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userAddDreamControllerProvider = Provider((ref) => UserAddDreamController(ref));

class UserAddDreamController extends Controller {
  final formKey = GlobalKey<FormState>();

  UserAddDreamController(super.ref);

  Future init() async {}

  String? validateDreamTitle(String? value) {
    return null;
  }

  void onValidation(BuildContext context) {}
}
