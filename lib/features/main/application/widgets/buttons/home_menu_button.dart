import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

class HomeMenuButton extends StatefulWidget {
  final Color scafoldBackgroundColor;
  final String text;
  final int animationDuration;

  final void Function() onClick;

  const HomeMenuButton({
    super.key,
    required this.onClick,
    required this.scafoldBackgroundColor,
    required this.text,
    required this.animationDuration,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomeMenuButton> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Color?> borderColorAnimation;

  bool isPressing = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );

    borderColorAnimation = ColorTween(
      begin: Colors.white.withOpacity(0.7),
      end: Colors.white.withOpacity(0.2),
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
            onLongPressStart: (_) {
              isPressing = true;
            },
            onLongPressEnd: (_) {
              isPressing = false;
            },
            onLongPressCancel: () {
              isPressing = false;
            },
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 58,
                    decoration: BoxDecoration(
                      color: widget.scafoldBackgroundColor,
                    ),
                  ),
                ),

                // Background stylish.
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 58,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          isPressing ? erevohWhite.withOpacity(0.2) : Colors.transparent,
                          isPressing ? erevohWhite.withOpacity(0.1) : Colors.transparent,
                          isPressing ? erevohWhite.withOpacity(0.1) : Colors.transparent,
                          isPressing ? erevohWhite.withOpacity(0.1) : Colors.transparent,
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.create_outlined,
                              size: 40,
                            ),
                          ),
                          AutoSizeText(
                            widget.text,
                            minFontSize: 24,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
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
