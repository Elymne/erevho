import 'package:erevho/core/l10n/tools/app_localisation_tools.dart';
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
  late final AppLocalisationTools ap = ref.read(appLocalisationToolsProvider);

  @override
  void initState() {
    super.initState();
    controller.init(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(controller.viewVisibilityProvider.notifier).state = true;
      ref.read(controller.assetsPositionProvider.notifier).state = MontainAndTreeBackground.endingAnimationAssetsPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewVisibility = ref.watch(controller.viewVisibilityProvider);
    final assetsPosition = ref.watch(controller.assetsPositionProvider);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            MontainAndTreeBackground(assetsPosition: assetsPosition),
            AnimatedOpacity(
              opacity: viewVisibility ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: Text(
                  ap.current.touch_screen,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w100,
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
