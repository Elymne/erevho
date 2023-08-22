import 'package:erevho/core/controller.dart';
import 'package:erevho/core/rive/custom_one_shot_controller.dart';
import 'package:erevho/features/main/application/pages/user_home/user_home_page.dart';
import 'package:erevho/features/main/domain/usecases/user_data/get_home_message_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

final homeControllerProvider = Provider((ref) => HomeController(ref));

class HomeController extends Controller {
  late final GetHomeMessageUsecase getHomeMessageUsecase = ref.read(getHomeMessageUsecaseProvider);
  final homeMessageProvider = StateProvider<GetHomeMessageUsecaseResult?>((ref) => null);

  // Animation controller for rive Widget. Each controller stock an animation.
  late final RiveAnimationController initAnimationController = CustomOneShotController(
    'init',
    onStop: () {
      // When the first animation 'init' ends, we start the loop one 'Idles_one'.
      // We also display the center text that is attached to the OpacityAnimation widget.
      idlesAnimationController.isActive = true;
    },
  );
  late final RiveAnimationController idlesAnimationController = SimpleAnimation('Idles_one');

  Future init() async {
    ref.read(homeMessageProvider.notifier).state = await getHomeMessageUsecase.perform();
  }

  void goToUserHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserHomePage()),
    );
  }

  HomeController(super.ref);
}
