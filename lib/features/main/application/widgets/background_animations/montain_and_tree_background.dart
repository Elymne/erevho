import 'package:flutter/material.dart';

class MontainAndTreeBackground extends StatefulWidget {
  final BackgroundAnimationState currentState;

  const MontainAndTreeBackground({super.key, required this.currentState});

  @override
  State<StatefulWidget> createState() => MontainAndTreeBackgroundState();
}

class MontainAndTreeBackgroundState extends State<MontainAndTreeBackground> {
  late final double screenWidth = MediaQuery.of(context).size.width;
  late final double screenHeight = MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Image(
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          image: AssetImage(
            'assets/backgrounds/sky.png',
          ),
        ),
        // MOON IMAGE.
        AnimatedAlign(
          duration: const Duration(milliseconds: 1500),
          alignment: _currentMoonAlignment,
          curve: Curves.fastOutSlowIn,
          child: Image(
            fit: BoxFit.fill,
            width: screenWidth / 1.1,
            height: screenWidth / 1.1,
            image: const AssetImage('assets/backgrounds/moon.png'),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: Image(
              image: AssetImage(
                'assets/backgrounds/3stMountain.png',
              ),
            ),
          ),
        ),
        AnimatedAlign(
          duration: const Duration(milliseconds: 1500),
          alignment: _currentLeftCloudsAlignment,
          curve: Curves.fastOutSlowIn,
          child: Image(
            fit: BoxFit.fitHeight,
            width: MediaQuery.of(context).size.width / 1.1,
            opacity: const AlwaysStoppedAnimation(0.5),
            image: const AssetImage('assets/backgrounds/leftclouds.png'),
          ),
        ),
        AnimatedAlign(
          duration: const Duration(milliseconds: 1500),
          alignment: _currentRightCloudsAlignment,
          curve: Curves.fastOutSlowIn,
          child: Image(
            fit: BoxFit.fitHeight,
            width: MediaQuery.of(context).size.width / 1.1,
            opacity: const AlwaysStoppedAnimation(0.5),
            image: const AssetImage('assets/backgrounds/rightclouds.png'),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Image(
              image: AssetImage('assets/backgrounds/2stMountain.png'),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Image(
            image: AssetImage(
              'assets/backgrounds/1stMountain.png',
            ),
          ),
        ),
      ],
    );
  }

  Alignment get _currentMoonAlignment {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return const Alignment(-20, 0);
      case BackgroundAnimationState.middle:
        return const Alignment(0, -1);
      case BackgroundAnimationState.end:
        return const Alignment(20, 0);
    }
  }

  Alignment get _currentLeftCloudsAlignment {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return const Alignment(-20, 0);
      case BackgroundAnimationState.middle:
        return const Alignment(-1, 1);
      case BackgroundAnimationState.end:
        return const Alignment(-20, 0);
    }
  }

  Alignment get _currentRightCloudsAlignment {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return const Alignment(20, 0);
      case BackgroundAnimationState.middle:
        return const Alignment(1, 1);
      case BackgroundAnimationState.end:
        return const Alignment(20, 0);
    }
  }
}

enum BackgroundAnimationState { start, middle, end }
