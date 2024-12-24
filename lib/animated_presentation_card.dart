import 'dart:math' show pi;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

const _maxHeight = 120.0;
const _minHeight = 80.0;

class AnimatedPresentationCard extends StatefulWidget {
  const AnimatedPresentationCard({super.key});

  @override
  State<AnimatedPresentationCard> createState() => _AnimatedPresentationCardState();
}

class _AnimatedPresentationCardState extends State<AnimatedPresentationCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _small = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text('Animated Presentation Card'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final value = Curves.easeOut.transform(_controller.value);
            final color = Color.lerp(
              Colors.black,
              Colors.white,
              value,
            );
            final textColor = Color.lerp(
              Colors.white,
              Colors.black,
              value,
            );
            final angle = lerpDouble(0, pi, value) ?? 0.0;
            final height = lerpDouble(_minHeight, _maxHeight, value);
            final textSizeTitle = lerpDouble(20, 25, value);
            final borderRadius = BorderRadius.lerp(
              const BorderRadius.all(
                Radius.circular(30),
              ),
              const BorderRadius.all(
                Radius.circular(30),
              ),
              value,
            )!;

            return Material(
              elevation: 10,
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _small = !_small;
                  });

                  if (_small) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                borderRadius: borderRadius,
                child: SizedBox(
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.rotate(
                          angle: angle,
                          child: const CircleAvatar(
                            child: Text('W'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wilson Toribio',
                              style: TextStyle(
                                fontSize: textSizeTitle,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            Text(
                              '@wilsonveloper',
                              style: TextStyle(
                                fontSize: 12,
                                color: textColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
