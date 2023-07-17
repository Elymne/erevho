import 'package:erevho/core/controller.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/features/main/application/pages/home/home_page.dart';
import 'package:erevho/features/main/domain/usecases/user_data/create_new_user_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

final userInitialisationControllerProvider = Provider((ref) => UserInitialisationController(ref));

class UserInitialisationController extends Controller {
  // Injections.
  late final AppLocalisationTools ap = ref.read(appLocalisationToolsProvider);
  late final CreateNewUserParamsUsecase createNewUserParamsUsecase = ref.read(createNewUserParamsUsecaseProvider);

  // State values for view.
  final viewVisibilityProvider = StateProvider((ref) => false);

  // Animation controller for Rive widget.
  late final RiveAnimationController riveAnimationController = SimpleAnimation('startAnimation');

  // Controller values.
  final formKey = GlobalKey<FormState>();
  String? nameText;

  UserInitialisationController(super.ref);

  String? validateNameTextfield(String? value) {
    if (value == null || value.isEmpty) {
      return ap.current.name_textfield_warning;
    }
    nameText = value;
    return null;
  }

  void onValidation(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        await createNewUserParamsUsecase.perform(CreateNewUserParamsUsecaseParams(userName: nameText!));
        ref.read(viewVisibilityProvider.notifier).state = false;
        await Future.delayed(const Duration(milliseconds: 1000));
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ap.current.user_init_snackbar_error)),
        );
      }
    }
  }
}
