import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Persona5Animation extends StatefulWidget {
  const Persona5Animation({super.key});

  @override
  State<Persona5Animation> createState() => _Persona5AnimationState();
}

class _Persona5AnimationState extends State<Persona5Animation> with TickerProviderStateMixin {
  bool _loadingImage = true;
  ui.Image? _image;
  late AnimationController _controller;
  late final Animation<double> _heightAnimation;
  late final Animation<double> _topAnimation;
  late final Animation<double> _messageWidth;

  @override
  void initState() {
    super.initState();

    loadImage('assets/images/face1.png').then((img) {
      setState(() {
        _image = img;
        _loadingImage = false;
      });

      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
      )..forward();

      _heightAnimation = Tween<double>(
        begin: 50,
        end: 110,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.bounceOut,
        ),
      );

      _topAnimation = Tween<double>(
        begin: 60,
        end: 20,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.elasticOut,
        ),
      );

      _messageWidth = Tween<double>(
        begin: 30,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.elasticOut,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: switch (_loadingImage) {
          false => AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Center(
                  child: Container(
                    width: 600,
                    height: 800,
                    transform: Matrix4.identity()..rotateZ((2 * math.pi) / 0.990),
                    decoration: BoxDecoration(
                      color: const Color(0xFFAF0000),
                      border: Border.all(
                        width: 10,
                        color: Colors.black,
                      )
                    ),
                    child: Column(
                      spacing: 0,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPaint(
                              painter: ProfilePainter(
                                _image!,
                                _heightAnimation.value,
                                _topAnimation.value,
                              ),
                              size: const Size(150, 150),
                            ),
                            CustomPaint(
                              painter: MyCustomPainter(
                                  'Hey are you a Flutter Developer?',
                                  _messageWidth.value),
                              size: const Size(400, 100),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPaint(
                              painter: ProfilePainter(
                                _image!,
                                _heightAnimation.value,
                                _topAnimation.value,
                              ),
                              size: const Size(150, 150),
                            ),
                            CustomPaint(
                              painter: MyCustomPainter(
                                  'I want to hire you right now! please provide me with your CV...',
                                  _messageWidth.value),
                              size: const Size(400, 100),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPaint(
                              painter: ProfilePainter(
                                _image!,
                                _heightAnimation.value,
                                _topAnimation.value,
                              ),
                              size: const Size(150, 150),
                            ),
                            CustomPaint(
                              painter: MyCustomPainter(
                                  'We’re currently looking for someone with your expertise and believe you\'d be a great fit. Our offer includes a highly competitive salary. ',
                                  _messageWidth.value),
                              size: const Size(400, 100),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
          true => const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
        });
  }
}

class MyCustomPainter extends CustomPainter {
  final String text;
  final double messageWidth;

  MyCustomPainter(this.text, this.messageWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(
      text: text,
      style: const TextStyle(
        height: 1.3,
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
    double addHeight = 0;

    if (text.length < 38) {
      addHeight = 0;
    } else if (text.length < 78) {
      addHeight = 10;
    } else if (text.length < 120) {
      addHeight = 40;
    } else if (text.length < 160) {
      addHeight = 60;
    }

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    final innerFillPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final innerStrokePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final outerFillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final outerStrokePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path outerPath = Path()
      ..moveTo(5, 95 + addHeight)
      ..lineTo(25, 25)
      ..lineTo(410 - messageWidth, 5)
      ..lineTo(380 - messageWidth, 100 + addHeight)
      ..close();

    Path path = Path()
      ..moveTo(10, 90 + addHeight) // bottom - left
      ..lineTo(30, 30) // top - left
      ..lineTo(390 - messageWidth, 10)
      ..lineTo(375 - messageWidth, 95 + addHeight)
      ..close();

    canvas.drawPath(outerPath, outerFillPaint);
    canvas.drawPath(outerPath, outerStrokePaint);

    canvas.drawPath(path, innerFillPaint);
    canvas.drawPath(path, innerStrokePaint);

    textPainter.layout(maxWidth: 320);
    textPainter.paint(
      canvas,
      const Offset(50, 80 / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ProfilePainter extends CustomPainter {
  final ui.Image image;
  final double height;
  final double top;

  ProfilePainter(
    this.image,
    this.height,
    this.top,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final inner2FillPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final inner2StrokePaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final innerFillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerStrokePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final outerFillPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final outerStrokePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path outerPath = Path()
      ..moveTo(30, 140)
      ..lineTo(10, 20)
      ..lineTo(130, 40)
      ..lineTo(150, 120)
      ..close();

    Path innerPath = Path()
      ..moveTo(40, 130)
      ..lineTo(20, 24)
      ..lineTo(125, 45)
      ..lineTo(145, 115)
      ..close();

    Path inner2Path = Path()
      ..moveTo(45, 125)
      ..lineTo(26, 35)
      ..lineTo(123, 50)
      ..lineTo(140, 110)
      ..close();

    canvas.drawPath(outerPath, outerFillPaint);
    canvas.drawPath(outerPath, outerStrokePaint);

    canvas.drawPath(innerPath, innerFillPaint);
    canvas.drawPath(innerPath, innerStrokePaint);

    canvas.drawPath(inner2Path, inner2FillPaint);
    canvas.drawPath(inner2Path, inner2StrokePaint);

    final src =
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble());

    final dst = Rect.fromLTWH(30, top, 110, height);

    canvas.drawImageRect(image, src, dst, Paint());
  }

  @override
  bool shouldRepaint(covariant ProfilePainter oldDelegate) {
    return oldDelegate.height != height || oldDelegate.top != top;
  }
}

Future<ui.Image> loadImage(String assetPath) async {
  final ByteData data = await rootBundle.load(assetPath);
  final ui.Codec codec =
      await ui.instantiateImageCodec(data.buffer.asUint8List());
  final ui.FrameInfo fi = await codec.getNextFrame();
  return fi.image;
}