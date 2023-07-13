// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MontainAndTreeBackground extends StatefulWidget {
  final BackgroundAnimationState currentState;

  const MontainAndTreeBackground({super.key, required this.currentState});

  @override
  State<StatefulWidget> createState() => MontainAndTreeBackgroundState();
}

class MontainAndTreeBackgroundState extends State<MontainAndTreeBackground> {
  late final double screenWidth = MediaQuery.of(context).size.width;
  late final double screenHeight = MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ? -- Gradient sky Background -- ? \\
        Container(
          width: screenWidth,
          height: screenHeight * 4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/backgrounds/gradient_sky.png',
              ),
            ),
          ),
        ),

        // ? -- Stars IMAGE -- ? \\
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2500),
          top: _currentYStarsPosition,
          curve: Curves.fastOutSlowIn,
          child: Image(
            fit: BoxFit.fitHeight,
            width: screenWidth,
            image: const AssetImage('assets/backgrounds/stars_1.png'),
          ),
        ),

        // ? -- MOON IMAGE -- ? \\
        AnimatedAlign(
          duration: const Duration(milliseconds: 2000),
          alignment: _currentMoonAlignment,
          curve: Curves.fastOutSlowIn,
          child: Image(
            fit: BoxFit.fill,
            width: screenWidth / 1.5,
            height: screenWidth / 1.5,
            image: const AssetImage('assets/backgrounds/moon.png'),
          ),
        ),

        // ? -- Third montains calc -- ? \\
        Positioned(
          bottom: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            padding: EdgeInsets.only(bottom: 100),
            width: _currentThirdMountainWidth,
            child: Image(
              fit: BoxFit.fitHeight,
              image: AssetImage(
                'assets/backgrounds/3stMountain.png',
              ),
            ),
          ),
        ),

        // ? -- Left cloud -- ? \\
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1500),
          left: _currentXPositionCloud,
          bottom: _currentYPositionCloud,
          curve: Curves.fastOutSlowIn,
          child: Image(
            fit: BoxFit.fitHeight,
            width: screenWidth - 10,
            opacity: const AlwaysStoppedAnimation(0.5),
            image: const AssetImage('assets/backgrounds/left_clouds.png'),
          ),
        ),

        // ? -- Right cloud -- ? \\
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1500),
          right: _currentXPositionCloud,
          bottom: _currentYPositionCloud,
          curve: Curves.fastOutSlowIn,
          child: Image(
            fit: BoxFit.fitHeight,
            width: screenWidth - 10,
            opacity: const AlwaysStoppedAnimation(0.5),
            image: const AssetImage('assets/backgrounds/right_clouds.png'),
          ),
        ),

        // ? -- secondMountain -- ? \\
        Positioned(
          bottom: 0,
          left: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1500),
            padding: EdgeInsets.only(bottom: 50),
            width: _currentSecondMountainWidth,
            child: Image(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/backgrounds/2stMountain.png'),
            ),
          ),
        ),

        // ? -- firstMountain -- ? \\
        Positioned(
          bottom: 0,
          left: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            width: _currentFirstMountainWidth,
            child: Image(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/backgrounds/1stMountain.png'),
            ),
          ),
        ),
      ],
    );
  }

  double get _currentYStarsPosition {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return -screenHeight;
      case BackgroundAnimationState.middle:
        return 0;
      case BackgroundAnimationState.end:
        return 0;
    }
  }

  Alignment get _currentMoonAlignment {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return const Alignment(-20, 0);
      case BackgroundAnimationState.middle:
        return const Alignment(0, -1);
      case BackgroundAnimationState.end:
        return const Alignment(0, -1);
    }
  }

  double get _currentThirdMountainWidth {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return screenWidth + 100;
      case BackgroundAnimationState.middle:
        return screenWidth;
      case BackgroundAnimationState.end:
        return screenWidth;
    }
  }

  double get _currentSecondMountainWidth {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return screenWidth + 200;
      case BackgroundAnimationState.middle:
        return screenWidth;
      case BackgroundAnimationState.end:
        return screenWidth;
    }
  }

  double get _currentFirstMountainWidth {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return screenWidth + 300;
      case BackgroundAnimationState.middle:
        return screenWidth;
      case BackgroundAnimationState.end:
        return screenWidth;
    }
  }

  double get _currentXPositionCloud {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return -screenWidth;
      case BackgroundAnimationState.middle:
        return 0;
      case BackgroundAnimationState.end:
        return 0;
    }
  }

  double get _currentYPositionCloud {
    switch (widget.currentState) {
      case BackgroundAnimationState.start:
        return 0;
      case BackgroundAnimationState.middle:
        return 0;
      case BackgroundAnimationState.end:
        return 0;
    }
  }
}

enum BackgroundAnimationState { start, middle, end }
