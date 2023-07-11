import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/splashscreen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TODO Créer une petite animation de loading.
/// Je ferais bien une vue qu rempli entièrement l'espace avec du paralaxe etc..
/// A voir si ça peut se faire rapidement avec des petits assets légers.
class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(splashControllerProvider);
    controller.init(context);
    return const Scaffold(
      body: Stack(
        children: [
          // Set here the animation, what should we do ? Flutter Animation ? Stack of images ? Gif ?

          // Clickable element.
          Center(
            child: Text('Splashscreen'),
          ),
        ],
      ),
      backgroundColor: nightGreyDarker,
    );
  }
}
