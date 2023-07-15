import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/user_initialisation/user_initialisation_controller.dart';
import 'package:erevho/features/main/application/widgets/background_animations/moon_and_star_background.dart';
import 'package:erevho/features/main/application/widgets/buttons/night_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInitialisationPage extends ConsumerStatefulWidget {
  const UserInitialisationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => UserInitialisationState();
}

class UserInitialisationState extends ConsumerState<UserInitialisationPage> {
  late final UserInitialisationController controller = ref.read(userInitialisationControllerProvider);
  late final AppLocalisationTools ap = ref.read(appLocalisationToolsProvider);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(controller.viewVisibilityProvider.notifier).state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewVisibility = ref.watch(controller.viewVisibilityProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: nightGreyDarker,
        body: Stack(
          children: [
            const MoonAndStarBackground(),
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
                          Text(ap.current.name_textfield_label),
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
            IgnorePointer(
              child: AnimatedOpacity(
                opacity: viewVisibility ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 1000),
                child: Container(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
