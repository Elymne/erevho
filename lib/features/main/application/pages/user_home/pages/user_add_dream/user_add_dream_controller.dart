import 'package:erevho/core/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userAddDreamControllerProvider = Provider((ref) => UserAddDreamController(ref));

class UserAddDreamController extends Controller {
  late void Function(String dreamTitle) onDreamAdded;
  final formKey = GlobalKey<FormState>();
  final textFieldController = TextEditingController();
  String? dreamTitle;

  UserAddDreamController(super.ref);

  Future init({required void Function(String dreamTitle) onDreamAdded}) async {
    this.onDreamAdded = onDreamAdded;
  }

  String? validateTitleTextfield(String? value) {
    if (value == null || value.isEmpty) return 'Tu dois au moins donner un titre à ton rêve !';
    if (value.length > 40) return 'Ton titre doit-être moins long (4O caractères maximum) !';
    dreamTitle = value;
    return null;
  }

  void onFormValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (context.mounted) {
        final dreamTitle = this.dreamTitle;
        _resetPage();
        onDreamAdded(dreamTitle!);
      }
    }
  }

  void _resetPage() {
    textFieldController.clear();
    dreamTitle = null;
  }
}
