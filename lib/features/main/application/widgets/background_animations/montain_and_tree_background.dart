import 'package:flutter/material.dart';

class MontainAndTreeBackground extends StatefulWidget {
  const MontainAndTreeBackground({super.key});

  @override
  State<StatefulWidget> createState() => MontainAndTreeBackgroundState();
}

class MontainAndTreeBackgroundState extends State<MontainAndTreeBackground> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Image(
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          image: AssetImage(
            'assets/backgrounds/sky.png',
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 60),
            child: Image(
              image: AssetImage(
                'assets/backgrounds/moon.png',
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 60),
            child: Image(
              image: AssetImage(
                'assets/backgrounds/3stMountain.png',
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 60),
            child: Image(
              opacity: AlwaysStoppedAnimation(0.4),
              image: AssetImage(
                'assets/backgrounds/leftclouds.png',
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 60),
            child: Image(
              opacity: AlwaysStoppedAnimation(0.4),
              image: AssetImage(
                'assets/backgrounds/rightclouds.png',
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Image(
              image: AssetImage(
                'assets/backgrounds/2stMountain.png',
              ),
            ),
          ),
        ),
        Align(
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
}
