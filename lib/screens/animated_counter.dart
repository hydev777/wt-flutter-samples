
import 'dart:math' show pi;

import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter({super.key});

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  late final Animation<double> numberChangeValue =
      Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  bool showText = true;
  int count = 0;
  int nextCount = 0;
  bool showShadow = false;
  Color shadowColor = Colors.blue[600]!;

  @override
  void initState() {
    super.initState();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        count++;
        showText = true;
        shadowColor = Colors.blue;
        _controller.reset();
      }
    });

    _controller.addListener(() {
      double animationValue = _controller.value * 2;

      if (animationValue > 0.2 && animationValue <= 0.9 && showText) {
        showShadow = true;
      }

      if (animationValue > 0.2 && animationValue <= 0.9 && showText) {
        shadowColor = Colors.blue[700]!;
      }

      if (animationValue > 0.4 && animationValue <= 0.9 && showText) {
        shadowColor = Colors.blue[800]!;
      }

      if (animationValue > 0.6 && animationValue <= 0.9 && showText) {
        shadowColor = Colors.blue[900]!;
      }

      if (animationValue > 1 && animationValue <= 2 && showText) {
        showShadow = false;
        showText = false;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Counter'),
        ),
        body: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              color: shadowColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            alignment: Alignment.topCenter,
                            child: Text(
                              count.toString(),
                              style: const TextStyle(fontSize: 140, height: 0.001),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            (count + 1).toString(),
                            style: const TextStyle(fontSize: 140, height: 0.001),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.forward();
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 100,
                          width: 200,
                          alignment: Alignment.topCenter,
                          child: Transform(
                            alignment: Alignment.bottomCenter,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateX((numberChangeValue.value) * pi),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: AnimatedContainer(
                                duration: const Duration(microseconds: 500),
                                decoration: BoxDecoration(
                                  color: showShadow ? shadowColor : Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                height: 100,
                                width: 200,
                                alignment: Alignment.bottomCenter,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..scale(showText ? 1.0 : -1.0, 1.0, 1.0)
                                    ..rotateZ(showText ? (pi * 2) : pi),
                                  alignment: Alignment.center,
                                  child: Text(
                                    showText
                                        ? count.toString()
                                        : (count + 1).toString(),
                                    style:
                                        const TextStyle(fontSize: 140, height: 0.001),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
