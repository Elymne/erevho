import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
import 'package:erevho/core/rive/custom_one_shot_controller.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/splashscreen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<SplashPage> {
  late final SplashController controller = ref.read(splashControllerProvider);
  late final AppLocalisationTools ap = ref.read(appLocalisationToolsProvider);

  late final RiveAnimationController startingAnimationController = CustomOneShotController(
    'startingAnimation',
    onStop: () {
      timeFlowAnimationController.isActive = true;
      ref.read(controller.titleVisibilityProvider.notifier).state = true;
    },
  );
  late final RiveAnimationController timeFlowAnimationController = SimpleAnimation('timeFlow');
  late final RiveAnimationController endingAnimationController = SimpleAnimation('endingAnimation');

  @override
  void initState() {
    super.initState();
    controller.init(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //ref.read(controller.viewVisibilityProvider.notifier).state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewVisibility = ref.watch(controller.viewVisibilityProvider);
    final titleVisibility = ref.watch(controller.titleVisibilityProvider);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            RiveAnimation.asset(
              'assets/rives/mountain_and_star.riv',
              antialiasing: false,
              fit: BoxFit.cover,
              controllers: [
                startingAnimationController,
                timeFlowAnimationController,
                endingAnimationController,
              ],
              onInit: (p0) {
                startingAnimationController.isActive = true;
                timeFlowAnimationController.isActive = false;
                endingAnimationController.isActive = false;
              },
            ),
            AnimatedOpacity(
              opacity: titleVisibility ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: erevohBlack.withOpacity(0.2),
                        spreadRadius: 0.0,
                        blurRadius: 5,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: AutoSizeText(
                    ap.current.touch_screen,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (viewVisibility) {
                  timeFlowAnimationController.isActive = false;
                  endingAnimationController.isActive = true;
                  controller.onScreenPress(context);
                }
              },
            ),
            IgnorePointer(
              child: AnimatedOpacity(
                opacity: viewVisibility ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 2000),
                child: Container(color: Colors.black),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
