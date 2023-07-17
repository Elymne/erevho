import 'package:erevho/core/controller.dart';
import 'package:erevho/core/rive/custom_one_shot_controller.dart';
import 'package:erevho/features/main/application/pages/home/home_page.dart';
import 'package:erevho/features/main/application/pages/user_initialisation/user_initialisation_page.dart';
import 'package:erevho/features/main/domain/usecases/user_data/is_first_launch_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

final splashControllerProvider = Provider((ref) => SplashScreenController(ref));

class SplashScreenController extends Controller {
  // Usecases injecteds.
  late final IsFirstLaunchUsecase isFirstLaunchUsecase = ref.read(isFirstLaunchUsecaseProvider);

  // State values for view.
  final viewVisibilityProvider = StateProvider((ref) => true);
  final titleVisibilityProvider = StateProvider((ref) => false);

  // Animation controller for rive Widget. Each controller stock an animation.
  late final RiveAnimationController startingAnimationController = CustomOneShotController(
    'startingAnimation',
    onStop: () {
      // When the first animation 'startingAnimation' ends, we start the loop one 'timeFlow'.
      // We also display the center text that is attached to the OpacityAnimation widget.
      timeFlowAnimationController.isActive = true;
      ref.read(titleVisibilityProvider.notifier).state = true;
    },
  );
  late final RiveAnimationController timeFlowAnimationController = SimpleAnimation('timeFlow');
  late final RiveAnimationController endingAnimationController = SimpleAnimation('endingAnimation');

  // Controller values.
  late final bool isFirstLaunch;

  SplashScreenController(super.ref);

  Future init(BuildContext context) async {
    isFirstLaunch = await isFirstLaunchUsecase.perform();
  }

  Future goToNextPage(BuildContext context) async {
    ref.read(viewVisibilityProvider.notifier).state = false;
    ref.read(titleVisibilityProvider.notifier).state = false;
    await Future.delayed(const Duration(milliseconds: 2000));
    if (context.mounted) {
      // In that case, user should set a name to use application from the init page.
      if (isFirstLaunch) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const UserInitialisationPage()),
          (route) => false,
        );
        return;
      }

      // Else we push it to teh classic home page.
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    }
  }
}
