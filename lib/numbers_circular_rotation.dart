import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedCircleNumbers extends StatefulWidget {
  const AnimatedCircleNumbers({super.key});

  @override
  State<AnimatedCircleNumbers> createState() => _AnimatedCircleNumbersState();
}

class _AnimatedCircleNumbersState extends State<AnimatedCircleNumbers>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;

  late Animation<double>? rotation;
  late Animation<double>? rotation2;
  late Animation<double>? rotation3;
  late Animation<double>? rotation4;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();

    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();

    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    )..repeat();

    _controller4 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..repeat();

    rotation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    rotation2 = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    rotation3 = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuart,
    );

    rotation4 = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animating Numbers in Circle'),
      ),
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  size: const Size(300, 300),
                  painter: AnimatedCircleNumberPainter(
                    numbers: List.generate(12, (index) => index + 1),
                    radius: 180,
                    rotationValue: rotation!.value,
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller2,
              builder: (context, child) {
                return CustomPaint(
                  size: const Size(300, 300),
                  painter: AnimatedCircleNumberPainter(
                    numbers: List.generate(12, (index) => index + 1),
                    radius: 140,
                    rotationValue: rotation2!.value,
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller3,
              builder: (context, child) {
                return CustomPaint(
                  size: const Size(300, 300),
                  painter: AnimatedCircleNumberPainter(
                    numbers: List.generate(12, (index) => index + 1),
                    radius: 100,
                    rotationValue: rotation3!.value,
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller4,
              builder: (context, child) {
                return CustomPaint(
                  size: const Size(300, 300),
                  painter: AnimatedCircleNumberPainter(
                    numbers: List.generate(12, (index) => index + 1),
                    radius: 60,
                    rotationValue: rotation4!.value,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedCircleNumberPainter extends CustomPainter {
  final List<int> numbers;
  final double radius;
  final double rotationValue; // Value from AnimationController (0.0 to 1.0)

  AnimatedCircleNumberPainter({
    required this.numbers,
    required this.radius,
    required this.rotationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Define text style
    const textStyle = TextStyle(color: Colors.black, fontSize: 18);

    // Calculate angle step for placing numbers
    final angleStep = 2 * pi / numbers.length;

    for (int i = 0; i < numbers.length; i++) {
      // Calculate the rotating angle including animation rotation
      double angle = (i * angleStep - pi / 2) + (rotationValue * 2 * pi);

      // Calculate the position of the number
      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);

      // Save the canvas state
      canvas.save();

      // Translate the canvas to the position of the text
      canvas.translate(x, y);

      // Rotate the canvas to align the text with the tangent of the circle
      canvas.rotate(angle + pi / 2); // Rotate to match the circle's direction

      // Prepare the text
      final textSpan = TextSpan(
        text: numbers[i].toString(),
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      // Draw the text centered
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );

      // Restore the canvas state
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
