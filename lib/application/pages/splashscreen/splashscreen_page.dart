import 'package:erevho/application/pages/splashscreen/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashscreenState();
}

class SplashscreenState extends State<SplashscreenPage> {
  final SplashscreenController controller = GetIt.instance();

  @override
  void initState() {
    super.initState();
    controller.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Splashscreen'),
    );
  }
}
