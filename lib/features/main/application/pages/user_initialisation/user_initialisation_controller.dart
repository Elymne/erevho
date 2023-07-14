import 'package:erevho/core/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInitialisationControllerProvider = Provider((ref) => UserInitialisationController(ref));

class UserInitialisationController extends Controller {
  final formKey = GlobalKey<FormState>();

  UserInitialisationController(super.ref);

  /// Lel
  String? validateTextfield(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vous devez rentrer un p\'tit nom :(';
    }
    return null;
  }

  void onValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }
}
