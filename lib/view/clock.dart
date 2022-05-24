import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);

    var outlineBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Color(0xFFEAECFF)
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    var secHand = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    var minHand = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    var hrHand = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Color(0xFFA74AB), Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);
    var hrHandX = centerX + 60 * cos(180 * pi / 180);
    var hrHandY = centerX + 60 * sin(180 * pi / 180);

    canvas.drawLine(center, Offset(hrHandX, hrHandY), hrHand);

    var minHandX = centerX + 80 * cos(45 * pi / 180);
    var minHandY = centerX + 80 * sin(45 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHand);

    var secHandX = centerX + 80 * cos(90 * pi / 180);
    var secHandY = centerX + 80 * sin(90 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHand);

    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint

    return true;
  }
}
