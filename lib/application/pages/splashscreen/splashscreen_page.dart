import 'package:erevho/application/pages/splashscreen/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashscreenPage extends StatelessWidget {
  final SplashscreenController controller = GetIt.instance();

  SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Splashscreen'),
    );
  }
}
