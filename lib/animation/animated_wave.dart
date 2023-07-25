import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:simple_animations/simple_animations.dart';

// import 'package:flutter/material.dart';
// import 'dart:math';

// class AnimatedWave extends StatelessWidget {
//   final double height;
//   final double speed;
//   final double offset;

//   AnimatedWave({required this.height, required this.speed, this.offset = 0.0});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return Container(
//         height: height,
//         width: constraints.biggest.width,
//         child: ControlledAnimation(
//             duration: Duration(milliseconds: (5000 / speed).round()),
//             tween: Tween(begin: 0.0, end: 2 * pi),
//             builder: (context, value) {
//               return CustomPaint(
//                 foregroundPainter: CurvePainter(value + offset),
//               );
//             }),
//       );
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedWave extends StatefulWidget {
  final double height;
  final double speed;
  final double offset;

  AnimatedWave({required this.height, required this.speed, this.offset = 0.0});

  @override
  _AnimatedWaveState createState() => _AnimatedWaveState();
}

class _AnimatedWaveState extends State<AnimatedWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (5000 / widget.speed).round()),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: widget.height,
        width: constraints.biggest.width,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              foregroundPainter:
                  CurvePainter(_controller.value + widget.offset),
            );
          },
        ),
      );
    });
  }
}

class CurvePainter extends CustomPainter {
  final double value;

  CurvePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = Colors.white.withAlpha(60);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
