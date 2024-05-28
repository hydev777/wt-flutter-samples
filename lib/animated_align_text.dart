import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;

class AnimatedAlignText extends StatefulWidget {
  const AnimatedAlignText({super.key});

  @override
  State<AnimatedAlignText> createState() => _AnimatedAlignTextState();
}

class _AnimatedAlignTextState extends State<AnimatedAlignText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation1;
  Alignment currentLocation = Alignment.topLeft;

  void move(Alignment to) {
    _animation1 = Tween(
      begin: currentLocation,
      end: to,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    currentLocation = to;

    _controller
      ..reset()
      ..forward();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    _animation1 = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final containerHeightLerp = lerpDouble(40, 60, _controller.value);
              final textBoldLerp = FontWeight.lerp(
                  FontWeight.normal, FontWeight.bold, _controller.value);
              final containerWidthLerp =
                  lerpDouble(140, 180, _controller.value);
              final containerBorderRadius = BorderRadius.lerp(
                  BorderRadius.circular(10),
                  BorderRadius.circular(15),
                  _controller.value);

              return Stack(
                children: [
                  BoxAnimated(
                    alignment: Alignment.topLeft,
                    containerHeightLerp: containerHeightLerp!,
                    containerWidthLerp: containerWidthLerp!,
                    currentAnimatedTextLocation: currentLocation,
                    containerBorderRadius: containerBorderRadius!,
                    onTap: () {
                      move(Alignment.topLeft);
                    },
                  ),
                  BoxAnimated(
                    alignment: Alignment.topCenter,
                    containerHeightLerp: containerHeightLerp,
                    containerWidthLerp: containerWidthLerp,
                    currentAnimatedTextLocation: currentLocation,
                    containerBorderRadius: containerBorderRadius,
                    onTap: () {
                      move(Alignment.topCenter);
                    },
                  ),
                  BoxAnimated(
                    alignment: Alignment.topRight,
                    containerHeightLerp: containerHeightLerp,
                    containerWidthLerp: containerWidthLerp,
                    currentAnimatedTextLocation: currentLocation,
                    containerBorderRadius: containerBorderRadius,
                    onTap: () {
                      move(Alignment.topRight);
                    },
                  ),
                  BoxAnimated(
                    alignment: Alignment.centerLeft,
                    containerHeightLerp: containerHeightLerp,
                    containerWidthLerp: containerWidthLerp,
                    currentAnimatedTextLocation: currentLocation,
                    containerBorderRadius: containerBorderRadius,
                    onTap: () {
                      move(Alignment.centerLeft);
                    },
                  ),
                  BoxAnimated(
                    alignment: Alignment.center,
                    containerHeightLerp: containerHeightLerp,
                    containerWidthLerp: containerWidthLerp,
                    currentAnimatedTextLocation: currentLocation,
                    containerBorderRadius: containerBorderRadius,
                    onTap: () {
                      move(Alignment.center);
                    },
                  ),
                  BoxAnimated(
                    alignment: Alignment.centerRight,
                    containerHeightLerp: containerHeightLerp,
                    containerWidthLerp: containerWidthLerp,
                    currentAnimatedTextLocation: currentLocation,
                    containerBorderRadius: containerBorderRadius,
                    onTap: () {
                      move(Alignment.centerRight);
                    },
                  ),
                  BoxAnimated(
                    alignment: Alignment.bottomLeft,
                    containerHeightLerp: containerHeightLerp,
                    containerWidthLerp: containerWidthLerp,
                    currentAnimatedTextLocation: currentLocation,
                    containerBorderRadius: containerBorderRadius,
                    onTap: () {
                      move(Alignment.bottomLeft);
                    },
                  ),
                  BoxAnimated(
                    alignment: Alignment.bottomCenter,
                    containerHeightLerp: containerHeightLerp,
                    containerWidthLerp: containerWidthLerp,
                    currentAnimatedTextLocation: currentLocation,
                    containerBorderRadius: containerBorderRadius,
                    onTap: () {
                      move(Alignment.bottomCenter);
                    },
                  ),
                  BoxAnimated(
                    alignment: Alignment.bottomRight,
                    containerHeightLerp: containerHeightLerp,
                    containerWidthLerp: containerWidthLerp,
                    currentAnimatedTextLocation: currentLocation,
                    containerBorderRadius: containerBorderRadius,
                    onTap: () {
                      move(Alignment.bottomRight);
                    },
                  ),
                  Align(
                    alignment: _animation1.value,
                    child: Container(
                      color: Colors.transparent,
                      height: containerHeightLerp,
                      width: containerWidthLerp,
                      alignment: Alignment.center,
                      child: Text(
                        'Wilsonveloper',
                        style:
                            TextStyle(fontSize: 20, fontWeight: textBoldLerp),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class BoxAnimated extends StatelessWidget {
  const BoxAnimated({
    super.key,
    required this.alignment,
    required this.currentAnimatedTextLocation,
    required this.onTap,
    required this.containerHeightLerp,
    required this.containerWidthLerp,
    required this.containerBorderRadius,
  });

  final Alignment alignment;
  final Alignment currentAnimatedTextLocation;
  final VoidCallback onTap;
  final double containerHeightLerp;
  final double containerWidthLerp;
  final BorderRadius containerBorderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: alignment,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            color: currentAnimatedTextLocation == alignment
                ? Colors.blue
                : Colors.black38,
            borderRadius: currentAnimatedTextLocation == alignment
                ? containerBorderRadius
                : BorderRadius.circular(10),
            border: currentAnimatedTextLocation == alignment
                ? Border.all(width: 2, color: Colors.black)
                : Border.all(width: 0, color: Colors.transparent),
          ),
          height: currentAnimatedTextLocation == alignment
              ? containerHeightLerp
              : 40,
          width: currentAnimatedTextLocation == alignment
              ? containerWidthLerp
              : 140,
        ),
      ),
    );
  }
}
