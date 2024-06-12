import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

double widthAndHeight = 100;

class ThreeDPlanes extends StatefulWidget {
  const ThreeDPlanes({super.key});

  @override
  State<ThreeDPlanes> createState() => _ThreeDPlanesState();
}

class _ThreeDPlanesState extends State<ThreeDPlanes>
    with TickerProviderStateMixin {
  late AnimationController _animationX;
  late AnimationController _animationY;
  late AnimationController _animationZ;
  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationX = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _animationZ = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    _animationY = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  void dispose() {
    _animationX.dispose();
    _animationZ.dispose();
    _animationY.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationX
      ..reset()
      ..repeat();
    _animationZ
      ..reset()
      ..repeat();
    _animationY
      ..reset()
      ..repeat();

    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Planes'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
            width: double.infinity,
          ),
          AnimatedBuilder(
              animation: Listenable.merge([
                _animationX,
                _animationZ,
                _animationY,
              ]),
              builder: (context, widget) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_animationX))
                    ..rotateZ(_animation.evaluate(_animationZ))
                    ..rotateY(_animation.evaluate(_animationY)),
                  child: Stack(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(
                            Vector3(0, 0, -widthAndHeight),
                          ),
                        child: Container(
                          color: Colors.purple,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi / 2.0),
                        child: Container(
                          color: Colors.red,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi / 2.0),
                        child: Container(
                          color: Colors.blue,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        width: widthAndHeight,
                        height: widthAndHeight,
                      ),
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi / 2.0),
                        child: Container(
                          color: Colors.orange,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi / 2.0),
                        child: Container(
                          color: Colors.brown,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
