import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/splashscreen/splash_controller.dart';
import 'package:erevho/features/main/application/widgets/background_animations/montain_and_tree_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  late final SplashController controller = ref.read(splashControllerProvider);

  @override
  void initState() {
    super.initState();
    controller.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentAnimationState = ref.watch(controller.backgroundAnimationStateProvider);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            MontainAndTreeBackground(
              currentState: currentAnimationState,
            ),
            AnimatedOpacity(
              opacity: currentAnimationState == BackgroundAnimationState.end ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: const Center(
                child: Text(
                  'Toucher l\'écran',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (currentAnimationState != BackgroundAnimationState.end) {
                  controller.onScreenPress(context);
                }
              },
            ),
          ],
        ),
        backgroundColor: nightGrey,
      ),
    );
  }
}
