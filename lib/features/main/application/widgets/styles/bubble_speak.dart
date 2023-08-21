import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';

/// Todo Virer ce truc, j'vais faire ma bulle avec Rive, bien plus simple.
class BubbleSpeak extends StatefulWidget {
  final Widget content;
  const BubbleSpeak({super.key, required this.content});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<BubbleSpeak> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: erevohWhite, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: widget.content,
          ),
        ),
        CustomPaint(
          painter: TrianglePainter(
            paintingStyle: PaintingStyle.fill,
          ),
          child: const SizedBox(
            height: 20,
            width: 40,
          ),
        ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  final PaintingStyle paintingStyle;

  TrianglePainter({this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = erevohWhite;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
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
