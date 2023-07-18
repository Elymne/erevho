import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userAddDreamControllerProvider = Provider((ref) => UserAddDreamController(ref));

class UserAddDreamController extends Controller {
  final formKey = GlobalKey<FormState>();

  String? username;

  UserAddDreamController(super.ref);

  Future init() async {}

  String? validateDreamTitle(String? value) {
    if (value == null || value.isEmpty) return 'Tu dois au moins donner un titre à ton rêve !';
    if (value.length > 40) return 'Ton titre doit-être moins long (4O caractères maximum) !';
    username = value;
    return null;
  }

  void onValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DreamFormPage(newTitle: username)),
        );
      }
    }
  }
}
