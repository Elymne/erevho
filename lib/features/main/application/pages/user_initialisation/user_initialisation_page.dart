import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/features/main/application/pages/user_initialisation/user_initialisation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

class UserInitialisationPage extends ConsumerStatefulWidget {
  const UserInitialisationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => UserInitialisationState();
}

class UserInitialisationState extends ConsumerState<UserInitialisationPage> {
  late final UserInitialisationController controller = ref.read(userInitialisationControllerProvider);
  late final AppLocalisationTools ap = ref.read(appLocalisationToolsProvider);
  late final RiveAnimationController riveAnimationController = SimpleAnimation('startAnimation');

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
        body: Stack(
          children: [
            RiveAnimation.asset(
              'assets/rives/moon_sky.riv',
              fit: BoxFit.cover,
              controllers: [riveAnimationController],
              onInit: (p0) {
                riveAnimationController.isActive = true;
              },
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.0,
                      ),
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          AutoSizeText(
                            maxLines: 1,
                            ap.current.name_textfield_label,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            validator: (value) => controller.validateNameTextfield(value),
                          ),
                          const SizedBox(height: 30),
                          OutlinedButton(
                            onPressed: () => controller.onValidation(context),
                            child: const Text('Valider'),
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
