import 'dart:ui';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/user_initialisation/user_initialisation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/background_animations/moon_and_star_background.dart';
import '../../widgets/buttons/night_button.dart';

class UserInitialisationPage extends ConsumerStatefulWidget {
  const UserInitialisationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => UserInitialisationState();
}

class UserInitialisationState extends ConsumerState<UserInitialisationPage> {
  late final controller = ref.read(userInitialisationControllerProvider);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: nightGreyDarker,
        body: Stack(
          children: [
            // Animated background.
            const MoonAndStarBackground(),

            // hummmmmm.
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.2),
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const Text('Spécification du nom d\'utilisateur : '),
                          const SizedBox(height: 30),
                          TextFormField(
                            validator: (value) => controller.validateNameTextfield(value),
                          ),
                          const SizedBox(height: 30),
                          NightButton(
                            onPressed: () => controller.onValidation(context),
                            text: 'Valider',
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
