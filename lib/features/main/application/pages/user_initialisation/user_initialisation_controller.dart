import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/application/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/user_data/create_new_user_data_usecase.dart';

final userInitialisationControllerProvider = Provider((ref) => UserInitialisationController(ref));

class UserInitialisationController extends Controller {
  // Usecases injecteds.
  late final createNewUserParamsUsecase = ref.read(createNewUserParamsUsecaseProvider);

  // State values for view.
  final viewVisibilityProvider = StateProvider((ref) => false);

  // Controller values.
  final formKey = GlobalKey<FormState>();
  String? nameText;

  UserInitialisationController(super.ref);

  String? validateNameTextfield(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vous devez rentrer un p\'tit nom :(';
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
          const SnackBar(content: Text('Une erreur est survenue lors de la création du profil')),
        );
      }
    }
  }
}
