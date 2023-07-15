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
  ConsumerState<ConsumerStatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  late final SplashController controller = ref.read(splashControllerProvider);
  late final AppLocalisationTools ap = ref.read(appLocalisationToolsProvider);

  late final RiveAnimationController startingAnimationController = CustomOneShotController(
    'startingAnimation',
    onStop: () {
      timeFlowAnimation.isActive = true;
    },
  );
  late final RiveAnimationController timeFlowAnimation = SimpleAnimation('timeFlow');

  @override
  void initState() {
    super.initState();
    controller.init(context);
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
              'assets/rives/mountain_and_star.riv',
              fit: BoxFit.cover,
              controllers: [
                startingAnimationController,
                timeFlowAnimation,
              ],
              onInit: (p0) {
                startingAnimationController.isActive = true;
                timeFlowAnimation.isActive = false;
              },
            ),
            AnimatedOpacity(
              opacity: viewVisibility ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Center(
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
            GestureDetector(
              onTap: () {
                if (viewVisibility) {
                  controller.onScreenPress(context);
                }
              },
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
        backgroundColor: nightGrey,
      ),
    );
  }
}
