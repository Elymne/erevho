import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/user_initialisation/user_initialisation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

class UserInitialisationPage extends ConsumerStatefulWidget {
  const UserInitialisationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<UserInitialisationPage> {
  late final UserInitialisationController controller = ref.read(userInitialisationControllerProvider);
  late final AppLocalisationTools alt = ref.read(appLocalisationToolsProvider);

  late final screenHeight = MediaQuery.of(context).size.height;

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
              controllers: [controller.riveAnimationController],
              onInit: (p0) {
                controller.riveAnimationController.isActive = true;
              },
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: erevohBlack.withOpacity(0.4),
                      ),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                maxLines: 1,
                                alt.current.name_textfield_label,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                maxLines: 2,
                                alt.current.name_textfield_label_more,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              validator: (value) => controller.validateNameTextfield(value),
                              decoration: InputDecoration(
                                hintText: alt.current.name_textfield_hint,
                                filled: true,
                                fillColor: erevohBlack.withOpacity(0.6),
                                errorStyle: const TextStyle(
                                  fontSize: 18,
                                  color: erevohRed,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            OutlinedButton(
                              onPressed: () => controller.onValidation(context),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: erevohBlack.withOpacity(0.6),
                                side: const BorderSide(
                                  color: erevohBlueNeon,
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: const AutoSizeText(
                                'Valider',
                                style: TextStyle(
                                  color: erevohWhite,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
