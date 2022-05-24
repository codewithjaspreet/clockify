import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 1), (timer) {
      {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();
  // 60 sec - 360  , 1sec - 6 degree
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xFF444974);

    var outlineBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFFEAECFF)
      ..strokeWidth = 12
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
    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);
    var hrHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hrHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    canvas.drawLine(center, Offset(hrHandX, hrHandY), hrHand);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHand);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHand);

    canvas.drawCircle(center, 16, centerFillBrush);

    var ocr = radius;
    var incr = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + ocr * cos(i * pi / 180);
      var y1 = centerX + ocr * sin(i * pi / 180);
      var x2 = centerX + incr * cos(i * pi / 180);
      var y2 = centerX + incr * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint

    return true;
  }
}
