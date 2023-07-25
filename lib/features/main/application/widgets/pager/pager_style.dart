import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

class PagerDots extends StatelessWidget {
  final int totalPages;
  final int currentPage;

  const PagerDots({super.key, required this.totalPages, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final List<_Dot> dots = [];

    for (var i = 0; i < totalPages; i++) {
      dots.add(_Dot(isCurrentDot: currentPage == i));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }
}

class _Dot extends StatefulWidget {
  final bool isCurrentDot;

  const _Dot({required this.isCurrentDot});

  @override
  State<StatefulWidget> createState() => _DotState();
}

class _DotState extends State<_Dot> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      padding: EdgeInsets.symmetric(horizontal: widget.isCurrentDot ? 6 : 3),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
        width: widget.isCurrentDot ? 14 : 10,
        height: widget.isCurrentDot ? 14 : 10,
        decoration: BoxDecoration(
          color: widget.isCurrentDot ? erevohWhite : erevohWhite.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
      ),
    );
  }
}
