import 'package:erevho/application/pages/splashscreen/splash_controller.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashState();
}

/// TODO Créer une petite animation de loading.
/// Je ferais bien une vue qu rempli entièrement l'espace avec du paralaxe etc..
/// A voir si ça peut se faire rapidement avec des petits assets légers.
class SplashState extends State<SplashPage> {
  final SplashController controller = GetIt.I();

  @override
  void initState() {
    super.initState();
    controller.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splashscreen')),
      backgroundColor: nightGreyDarker,
    );
  }
}
