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

    return Scaffold(
      body: Stack(
        children: [
          // Set here the animation, what should we do ? Flutter Animation ? Stack of images ? Gif ?
          MontainAndTreeBackground(
            currentState: currentAnimationState,
          ),
          // Clickable Screen.
          GestureDetector(
            onTap: () {
              if (currentAnimationState != BackgroundAnimationState.end) {
                controller.onScreenPress(context);
              }
            },
          ),
          // Petit texte du swag.
          const Center(
            child: Text('Toucher l\'écran'),
          ),
        ],
      ),
      backgroundColor: nightGrey,
    );
  }
}
