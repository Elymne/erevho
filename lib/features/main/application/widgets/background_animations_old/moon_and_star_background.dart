import 'package:flutter/material.dart';

class MoonAndStarBackground extends StatefulWidget {
  const MoonAndStarBackground({super.key});

  @override
  State<StatefulWidget> createState() => MoonAndStarBackgroundState();
}

class MoonAndStarBackgroundState extends State<MoonAndStarBackground> with TickerProviderStateMixin {
  late final double screenWidth = MediaQuery.of(context).size.width;
  late final double screenHeight = MediaQuery.of(context).size.height;

  late final AnimationController moonRotationController;
  late final AnimationController starRotationController;

  @override
  void initState() {
    super.initState();
    moonRotationController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );
    moonRotationController.repeat();

    starRotationController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );
    starRotationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    moonRotationController.duration = const Duration(seconds: 180);
    starRotationController.duration = const Duration(seconds: 120);

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 0, 0, 17),
                Color.fromARGB(255, 3, 3, 71),
                Color.fromARGB(255, 1, 21, 77),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(starRotationController),
            child: Image(
              fit: BoxFit.cover,
              width: screenWidth,
              image: const AssetImage('assets/backgrounds/stars_1.png'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(starRotationController),
            child: Image(
              fit: BoxFit.cover,
              width: screenWidth,
              image: const AssetImage('assets/backgrounds/stars_1.png'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(starRotationController),
            child: Image(
              fit: BoxFit.cover,
              width: screenWidth,
              image: const AssetImage('assets/backgrounds/stars_1.png'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(moonRotationController),
            child: Image(
              fit: BoxFit.cover,
              width: screenWidth,
              image: const AssetImage('assets/backgrounds/moon.png'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    starRotationController.dispose();
    moonRotationController.dispose();
    super.dispose();
  }
}
