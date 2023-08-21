import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeMenuButton extends StatefulWidget {
  final Color scafoldBackgroundColor;

  final void Function() onClick;

  const HomeMenuButton({
    super.key,
    required this.onClick,
    required this.scafoldBackgroundColor,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomeMenuButton> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation<Color?> borderColorAnimation;
  late final Animation<Color?> backgroundColorAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 4),
    );

    borderColorAnimation = ColorTween(
      begin: Colors.white.withOpacity(0.7),
      end: Colors.white.withOpacity(0.2),
    ).animate(animationController);

    backgroundColorAnimation = ColorTween(
      begin: Colors.white.withOpacity(0.1),
      end: Colors.white.withOpacity(0.01),
    ).animate(animationController);

    animationController.forward();
    animationController.addListener(() {
      if (animationController.isCompleted) {
        animationController.repeat(reverse: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => widget.onClick(),
            child: Stack(
              children: [
                // Bordure.
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.white,
                        borderColorAnimation.value!,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                // Fraud background.
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    height: 58,
                    decoration: BoxDecoration(
                      color: widget.scafoldBackgroundColor,
                    ),
                  ),
                ),

                // Gradient background.
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    height: 58,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          backgroundColorAnimation.value!,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "Accéder à mes rêves",
                          minFontSize: 24,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
