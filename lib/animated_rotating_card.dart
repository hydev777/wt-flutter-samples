import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedRotatingCard extends StatefulWidget {
  const AnimatedRotatingCard({super.key});

  @override
  State<AnimatedRotatingCard> createState() => _AnimatedRotatingCardState();
}

class _AnimatedRotatingCardState extends State<AnimatedRotatingCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _rotation = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutSine,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.identity()..rotateY(pi * _rotation.value),
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: const Text(
                    'I love Algorithms',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}