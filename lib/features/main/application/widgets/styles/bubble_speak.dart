import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

/// Todo Virer ce truc, j'vais faire ma bulle avec Rive, bien plus simple.
class BubbleSpeak extends StatefulWidget {
  final Widget content;
  final Color scafoldBackgroundColor;

  const BubbleSpeak({
    super.key,
    required this.content,
    required this.scafoldBackgroundColor,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<BubbleSpeak> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: erevohWhite,
              width: 1,
            ),
          ),
          child: Center(
            child: widget.content,
          ),
        ),
        const SizedBox(height: 3),
        CustomPaint(
          painter: TrianglePainter(widget.scafoldBackgroundColor),
          child: const SizedBox(height: 10, width: 20),
        ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color scafoldBackgroundColor;

  TrianglePainter(this.scafoldBackgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    // White border.
    canvas.drawPath(
        getTrianglePath(size.width, size.height),
        Paint()
          ..color = erevohWhite
          ..style = PaintingStyle.fill
          ..strokeWidth = 1);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x / 2, y)
      ..lineTo(x, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return false;
  }
}
