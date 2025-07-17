import 'package:flutter/material.dart';

class CoreDottedLine extends StatelessWidget {
  final double height;
  final Color color;

  const CoreDottedLine({this.height = 1, this.color = Colors.black, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: _DottedLinePainter(color: color, height: height),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final double height;
  final Color color;

  _DottedLinePainter({required this.color, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = height;

    const double dashWidth = 5;
    const double dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
