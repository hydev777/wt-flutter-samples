import 'package:flutter/material.dart';
import 'dart:math' show pi;

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    var path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }

    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );

    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  HalfCircleClipper({required this.side});

  @override
  Path getClip(Size size) {
    return side.toPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HalfCircle extends StatefulWidget {
  const HalfCircle({super.key});

  @override
  State<HalfCircle> createState() => _HalfCircleState();
}

class _HalfCircleState extends State<HalfCircle> with TickerProviderStateMixin {
  late AnimationController _counterClockwiseRotationController;
  late Animation<double> _counterClockwiseRotationAnimation;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();

    _counterClockwiseRotationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2.0),
    ).animate(
      CurvedAnimation(
        parent: _counterClockwiseRotationController,
        curve: Curves.bounceOut,
      ),
    );

    // flip animation

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    _flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(
      CurvedAnimation(
        parent: _flipController,
        curve: Curves.bounceOut,
      ),
    );

    // status listeners

    _counterClockwiseRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
          begin: _flipAnimation.value,
          end: _flipAnimation.value + pi,
        ).animate(
          CurvedAnimation(
            parent: _flipController,
            curve: Curves.bounceOut,
          ),
        );

        // reset the flip controller and start the animation

        _flipController
          ..reset()
          ..forward();
      }
    });

    _flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterClockwiseRotationAnimation = Tween<double>(
          begin: _counterClockwiseRotationAnimation.value,
          end: _counterClockwiseRotationAnimation.value + -(pi / 2.0),
        ).animate(
          CurvedAnimation(
            parent: _counterClockwiseRotationController,
            curve: Curves.bounceOut,
          ),
        );

        _counterClockwiseRotationController
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    _counterClockwiseRotationController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      _counterClockwiseRotationController
        ..reset()
        ..forward();
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Half Circle'),
        ),
        body: AnimatedBuilder(
          animation: _counterClockwiseRotationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_counterClockwiseRotationAnimation.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                      animation: _flipAnimation,
                      builder: (context, child) {
                        return Transform(
                          alignment: Alignment.centerRight,
                          transform: Matrix4.identity()
                            ..rotateY(
                              _flipAnimation.value,
                            ),
                          child: ClipPath(
                            clipper: HalfCircleClipper(side: CircleSide.left),
                            child: Container(
                              color: Colors.blue,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        );
                      }),
                  AnimatedBuilder(
                      animation: _flipAnimation,
                      builder: (context, child) {
                        return Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.identity()
                            ..rotateY(
                              _flipAnimation.value,
                            ),
                          child: ClipPath(
                            clipper: HalfCircleClipper(side: CircleSide.right),
                            child: Container(
                              color: Colors.yellow,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
