import 'package:erevho/core/controller.dart';
import 'package:erevho/features/main/application/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashControllerProvider = Provider((ref) => SplashController(ref));

class SplashController extends Controller {
  SplashController(super.ref);

  /// Call all that we need to make the app start swmoothly.
  /// Actualy, it just lainch a timer.
  /// May add animation.
  Future init(BuildContext context) async {}

  Future onScreenPress(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
