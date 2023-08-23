import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/application/pages/dream_form/dream_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userAddDreamControllerProvider = Provider((ref) => UserAddDreamController(ref));

class UserAddDreamController extends Controller {
  late final PageController pageController;
  final formKey = GlobalKey<FormState>();
  final textFieldController = TextEditingController();
  String? username;

  UserAddDreamController(super.ref);

  Future init(PageController pageController) async {
    this.pageController = pageController;
  }

  String? validateDreamTitle(String? value) {
    if (value == null || value.isEmpty) return 'Tu dois au moins donner un titre à ton rêve !';
    if (value.length > 40) return 'Ton titre doit-être moins long (4O caractères maximum) !';
    username = value;
    return null;
  }

  Future onValidation(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (context.mounted) {
        final username = this.username;
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DreamFormPage(newTitle: username),
          ),
        );

        _resetPage();
        pageController.jumpToPage(2);
      }
    }
  }

  void _resetPage() {
    textFieldController.clear();
    username = null;
  }
}
