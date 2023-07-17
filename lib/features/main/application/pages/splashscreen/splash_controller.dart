import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/application/pages/home/home_page.dart';
import 'package:erevho/features/main/application/pages/user_initialisation/user_initialisation_page.dart';
import 'package:erevho/features/main/domain/usecases/user_data/is_first_launch_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashControllerProvider = Provider((ref) => SplashController(ref));

class SplashController extends Controller {
  // Usecases injecteds.
  late final IsFirstLaunchUsecase isFirstLaunchUsecase = ref.read(isFirstLaunchUsecaseProvider);

  // State values for view.
  final viewVisibilityProvider = StateProvider((ref) => true);
  final titleVisibilityProvider = StateProvider((ref) => false);

  // Controller values.
  late final bool isFirstLaunch;

  SplashController(super.ref);

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
