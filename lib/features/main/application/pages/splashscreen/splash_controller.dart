import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/application/pages/home/home_page.dart';
import 'package:erevho/features/main/application/pages/user_initialisation/user_initialisation_page.dart';
import 'package:erevho/features/main/application/widgets/background_animations/montain_and_tree_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/user_params/check_user_params_usecase.dart';

final splashControllerProvider = Provider((ref) => SplashController(ref));

class SplashController extends Controller {
  // Usecases injecteds.
  late final IsFirstLaunchUsecase isFirstLaunchUsecase = ref.read(isFirstLaunchUsecaseProvider);

  // State values for view.
  final backgroundAnimationStateProvider = StateProvider((ref) => BackgroundAnimationState.start);

  // Controller values.
  late final bool isFirstLaunch;

  SplashController(super.ref);

  Future init(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    ref.read(backgroundAnimationStateProvider.notifier).state = BackgroundAnimationState.middle;
    isFirstLaunch = await isFirstLaunchUsecase.perform();
  }

  Future onScreenPress(BuildContext context) async {
    ref.read(backgroundAnimationStateProvider.notifier).state = BackgroundAnimationState.end;
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
