import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/application/pages/home/home_page.dart';
import 'package:erevho/features/main/application/widgets/background_animations/montain_and_tree_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashControllerProvider = Provider((ref) => SplashController(ref));

class SplashController extends Controller {
  // Viewmodel values sort of.
  final backgroundAnimationStateProvider = StateProvider((ref) => BackgroundAnimationState.start);

  SplashController(super.ref);

  Future init(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    ref.read(backgroundAnimationStateProvider.notifier).state = BackgroundAnimationState.middle;
  }

  Future onScreenPress(BuildContext context) async {
    ref.read(backgroundAnimationStateProvider.notifier).state = BackgroundAnimationState.end;
    await Future.delayed(const Duration(milliseconds: 2000));
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    }
  }
}
