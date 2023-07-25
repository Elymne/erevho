import 'package:flutter/material.dart';

class MontainAndTreeBackground extends StatefulWidget {
  static const defaultAssetsPosition = 0;
  static const endingAnimationAssetsPosition = 1;
  final int assetsPosition;

  const MontainAndTreeBackground({super.key, required this.assetsPosition});

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
          decoration: const BoxDecoration(
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
            padding: const EdgeInsets.only(bottom: 100),
            width: _currentThirdMountainWidth,
            child: const Image(
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
            padding: const EdgeInsets.only(bottom: 50),
            width: _currentSecondMountainWidth,
            child: const Image(
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
            child: const Image(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/backgrounds/1stMountain.png'),
            ),
          ),
        ),
      ],
    );
  }

  double get _currentYStarsPosition {
    switch (widget.assetsPosition) {
      case MontainAndTreeBackground.defaultAssetsPosition:
        return -screenHeight;
      case MontainAndTreeBackground.endingAnimationAssetsPosition:
        return 0;
    }
    return 0;
  }

  Alignment get _currentMoonAlignment {
    switch (widget.assetsPosition) {
      case MontainAndTreeBackground.defaultAssetsPosition:
        return const Alignment(-20, 0);
      case MontainAndTreeBackground.endingAnimationAssetsPosition:
        return const Alignment(0, -1);
    }
    return const Alignment(0, -1);
  }

  double get _currentThirdMountainWidth {
    switch (widget.assetsPosition) {
      case MontainAndTreeBackground.defaultAssetsPosition:
        return screenWidth + 100;
      case MontainAndTreeBackground.endingAnimationAssetsPosition:
        return screenWidth;
    }
    return 0;
  }

  double get _currentSecondMountainWidth {
    switch (widget.assetsPosition) {
      case MontainAndTreeBackground.defaultAssetsPosition:
        return screenWidth + 200;
      case MontainAndTreeBackground.endingAnimationAssetsPosition:
        return screenWidth;
    }
    return 0;
  }

  double get _currentFirstMountainWidth {
    switch (widget.assetsPosition) {
      case MontainAndTreeBackground.defaultAssetsPosition:
        return screenWidth + 300;
      case MontainAndTreeBackground.endingAnimationAssetsPosition:
        return screenWidth;
    }
    return 0;
  }

  double get _currentXPositionCloud {
    switch (widget.assetsPosition) {
      case MontainAndTreeBackground.defaultAssetsPosition:
        return -screenWidth;
      case MontainAndTreeBackground.endingAnimationAssetsPosition:
        return 0;
    }
    return 0;
  }

  double get _currentYPositionCloud {
    switch (widget.assetsPosition) {
      case MontainAndTreeBackground.defaultAssetsPosition:
        return 0;
      case MontainAndTreeBackground.endingAnimationAssetsPosition:
        return 0;
    }
    return 0;
  }
}
